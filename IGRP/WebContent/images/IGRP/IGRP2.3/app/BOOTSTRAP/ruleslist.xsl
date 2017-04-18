<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <style>
        </style>
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
                        <xsl:if  test="rows/content/separatorlist_1">
                          <div  class="box gen-container-item ">
                            <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                  <xsl:if  test="rows/content/separatorlist_1/fields/name">
                                    <div  class="form-group col-md-6   gen-fields-holder gen-fields-holder" item-name="name" item-type="text">
                                      <label for="{rows/content/separatorlist_1/fields/name/@name}">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/separatorlist_1/fields/name/label"/>
                                        </span>
                                      </label>
                                      <input type="text" value="{rows/content/separatorlist_1/fields/name/value}" class="form-control" id="{rows/content/separatorlist_1/fields/name/@name}" name="{rows/content/separatorlist_1/fields/name/@name}" maxlength="30">
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/separatorlist_1/fields/event">
                                    <div  class="col-md-6 form-group  gen-fields-holder gen-fields-holder" item-name="event" item-type="select">
                                      <label for="{rows/content/separatorlist_1/fields/event/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_1/fields/event/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_1_event" name="{rows/content/separatorlist_1/fields/event/@name}">
                                        <xsl:for-each select="rows/content/separatorlist_1/fields/event/list/option">
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
                                  <xsl:if  test="rows/content/separatorlist_1/fields/conditionvalue">
                                    <div  class="box-head subtitle gen-fields-holder gen-fields-holder">
                                      <xsl:value-of select="rows/content/separatorlist_1/fields/conditionvalue/label"/>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/separatorlist_1/fields/condition">
                                    <div  class="col-md-6 form-group  gen-fields-holder gen-fields-holder" item-name="condition" item-type="select">
                                      <label for="{rows/content/separatorlist_1/fields/condition/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_1/fields/condition/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_1_condition" name="{rows/content/separatorlist_1/fields/condition/@name}">
                                        <xsl:for-each select="rows/content/separatorlist_1/fields/condition/list/option">
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
                                  <xsl:if  test="rows/content/separatorlist_1/fields/value">
                                    <div  class="form-group col-md-6   gen-fields-holder gen-fields-holder" item-name="value" item-type="text">
                                      <label for="{rows/content/separatorlist_1/fields/value/@name}">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/separatorlist_1/fields/value/label"/>
                                        </span>
                                      </label>
                                      <input type="text" value="{rows/content/separatorlist_1/fields/value/value}" class="form-control" id="{rows/content/separatorlist_1/fields/value/@name}" name="{rows/content/separatorlist_1/fields/value/@name}" maxlength="30">
                                      </input>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/separatorlist_1/fields/actiontarget">
                                    <div  class="box-head subtitle gen-fields-holder gen-fields-holder">
                                      <xsl:value-of select="rows/content/separatorlist_1/fields/actiontarget/label"/>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/separatorlist_1/fields/action">
                                    <div  class="col-md-6 form-group  gen-fields-holder gen-fields-holder" item-name="action" item-type="select">
                                      <label for="{rows/content/separatorlist_1/fields/action/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_1/fields/action/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_1_action" name="{rows/content/separatorlist_1/fields/action/@name}">
                                        <xsl:for-each select="rows/content/separatorlist_1/fields/action/list/option">
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
                                  <xsl:if  test="rows/content/separatorlist_1/fields/targets">
                                    <div  class="col-md-6 form-group  gen-fields-holder gen-fields-holder" item-name="targets" item-type="select">
                                      <label for="{rows/content/separatorlist_1/fields/targets/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_1/fields/targets/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_1_targets" name="{rows/content/separatorlist_1/fields/targets/@name}" multiple="multiple">
                                        <xsl:for-each select="rows/content/separatorlist_1/fields/targets/list/option">
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
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr gen-id="drop-zone" gen-field-template="th">
                                      <xsl:if  test="rows/content/separatorlist_1/fields/name">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/name/@table='true'">
                                          <th align="" item-name="name" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/name/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/separatorlist_1/fields/event">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/event/@table='true'">
                                          <th align="" item-name="event" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/event/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/separatorlist_1/fields/condition">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/condition/@table='true'">
                                          <th align="" item-name="condition" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/condition/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/separatorlist_1/fields/value">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/value/@table='true'">
                                          <th align="" item-name="value" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/value/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/separatorlist_1/fields/action">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/action/@table='true'">
                                          <th align="" item-name="action" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/action/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/separatorlist_1/fields/targets">
                                        <xsl:if  test="//rows/content/separatorlist_1/fields/targets/@table='true'">
                                          <th align="" item-name="targets" class=" gen-fields-holder">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/targets/label"/>
                                            </span>
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
                                    <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                      <tr gen-id="drop-zone" gen-field-template="td">
                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                        <xsl:if  test="name">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/name/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/name/label}" class="text">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="name_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_name_fk" value="{name}"/>
                                                <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_name_fk" value="{name}"/>
                                              <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="event">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/event/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/event/label}" class="select">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="event_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_event_fk" value="{event}"/>
                                                <input type="hidden" name="p_event_fk_desc" value="{event_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_event_fk" value="{event}"/>
                                              <input type="hidden" name="p_event_fk_desc" value="{event_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="condition">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/condition/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/condition/label}" class="select">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="condition_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_condition_fk" value="{condition}"/>
                                                <input type="hidden" name="p_condition_fk_desc" value="{condition_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_condition_fk" value="{condition}"/>
                                              <input type="hidden" name="p_condition_fk_desc" value="{condition_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="value">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/value/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/value/label}" class="text">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="value_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_value_fk" value="{value}"/>
                                                <input type="hidden" name="p_value_fk_desc" value="{value_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_value_fk" value="{value}"/>
                                              <input type="hidden" name="p_value_fk_desc" value="{value_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="action">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/action/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/action/label}" class="select">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="action_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_action_fk" value="{action}"/>
                                                <input type="hidden" name="p_action_fk_desc" value="{action_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_action_fk" value="{action}"/>
                                              <input type="hidden" name="p_action_fk_desc" value="{action_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="targets">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/separatorlist_1/fields/targets/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/targets/label}" class="select">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="targets_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_targets_fk" value="{targets}"/>
                                                <input type="hidden" name="p_targets_fk_desc" value="{targets_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_targets_fk" value="{targets}"/>
                                              <input type="hidden" name="p_targets_fk_desc" value="{targets_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <span class="table-row-edit btn" rel="separatorlist_1">
                                            <i class="fa fa-pencil"/>
                                          </span>
                                          <span class="table-row-remove btn" rel="separatorlist_1">
                                            <i class="fa fa-times"/>
                                          </span>
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
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1461603374101"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1461603374101"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1461603374101"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1461603374101"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1461603374101"/>
</xsl:stylesheet>
