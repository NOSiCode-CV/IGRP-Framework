<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/tablefx/buttonlist/btnlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
      
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/app.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/services.css"/>

      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default">
          <div class="container-fluid">
            <div class="row">

              <xsl:call-template name="SA-sidebar">
                <xsl:with-param name="drag" select="true()"/>
              </xsl:call-template>

              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                 
                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>

                
                  
                    <div id="sa-btns-holder" class="clearfix">
                      <xsl:if test="rows/content/form/label/voltar_inicio">
                        <a href="{rows/content/form/value/voltar_inicio}" class="btn btn-warning" target="_self">
                          <i class="fa fa-chevron-left"></i><xsl:value-of select="rows/content/form/label/voltar_inicio"/>
                        </a>
                      </xsl:if>
                      <xsl:if test="rows/content/form/label/save_favorites">
                        <a href="{rows/content/form/value/save_favorites}" id="sa-save-favs" class="btn btn-success" target="_self">
                          <i class="fa fa-check"></i><xsl:value-of select="rows/content/form/label/save_favorites"/>
                        </a>
                      </xsl:if>
                    </div>
                  
                 

                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        
                        <xsl:variable name="conutfav" select="count(rows/content/form/table/lista_favoritos/value/row)"/>

                        <xsl:variable name="mdclass">
                          <xsl:choose>
                            <xsl:when test="$conutfav &lt; 3">6</xsl:when>
                            <xsl:when test="$conutfav &gt;= 3 and $conutfav &lt;= 6">4</xsl:when>
                            <xsl:when test="$conutfav &gt; 6 and $conutfav &lt;= 8">3</xsl:when>
                            <xsl:otherwise>2</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>

                        <div class="sa-favorites-holder">
                        <xsl:if test="rows/content/form/label/lista_favoritos">
                          <div class="table-btn-list self-boxed-item">
                            <div class="self-boxed-inner" list-style="buttonlist" id="sa-favorites-list">
                              <xsl:for-each select="rows/content/form/table/lista_favoritos/value/row">
                                <div class="btn-list-item col-sm-3 col-xs-6 col-md-{$mdclass}" data-id="{id_servico_favorito}" data-menu-type="{tipo_menu_fav}">
                                  <a href="#" class="sa-remove-favorite"><i class="fa fa-times"></i></a>
                                  <div class="card">
                                    <a href="{link_favorito}" class="card-container btn-services" target="_blank" data-toggle="tooltip">
                                      <xsl:attribute name="title">
                                        <xsl:if test="string-length(link_favorito_desc) &gt;= 27">
                                          <xsl:value-of select="link_favorito_desc"/>
                                        </xsl:if>
                                      </xsl:attribute>
                                      <div class="card-icon">
                                        <xsl:if test="icon and icon != ''">
                                          <xsl:attribute name="style">
                                            <xsl:text>background-image:url('</xsl:text><xsl:value-of select="icon"/><xsl:text>')</xsl:text>
                                          </xsl:attribute>
                                          <!--<img class="" src="{icon}"/>-->
                                        </xsl:if>
                                      </div>
                                      <span class="card-text txt-ellipsis" bg-color="1" style="background: {cor};">
                                        <i class="fa fa-plus-circle plus open-info"/>
                                        <i class="fa fa-minus-circle minus open-info"/>
                                        <xsl:value-of select="link_favorito_desc"/>
                                      </span>
                                      <span class="app-info" bg-color="1" style="background: {cor};">
                                        <xsl:value-of select="info_fav"/>
                                      </span>
                                    </a>
                                  </div>
                                </div>
                              </xsl:for-each>
                            </div>
                          </div>
                        </xsl:if>
                        </div>

                        <!-- <xsl:if test="rows/content/form/label/lista_servicos">
                          <div class="box box-table-contents gen-item-boxed gen-container-item" item-name="lista_servicos">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/lista_servicos"/>
                              </h3>
                            </div>
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                <xsl:with-param name="rel" select="'lista_servicos'"/>
                              </xsl:apply-templates>
                              <table id="lista_servicos" class="table table-striped gen-data-table  ">
                                <thead>
                                  <tr>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/menu">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/menu/@visible)">
                                        <th item-name="menu" item-type="text">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/menu"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/submenu">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/submenu/@visible)">
                                        <th item-name="submenu" item-type="text">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/submenu"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/desc_servico">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/desc_servico/@visible)">
                                        <th item-name="desc_servico" item-type="icon">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/desc_servico"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/link_servico">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/link_servico/@visible)">
                                        <th item-name="link_servico" item-type="link">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/link_servico"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/form/table/lista_servicos/value/row[not(@total='yes')]">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <xsl:if test="menu">
                                        <xsl:if test="not(menu/@visible)">
                                          <td item-name="menu" item-type="text" data-row="{position()}" data-title="{../../label/menu}">
                                            <span>
                                              <xsl:value-of select="menu"/>
                                            </span>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="menu/@visible = 'false'">
                                          <input type="hidden" name="p_menu_fk" value="menu"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="submenu">
                                        <xsl:if test="not(submenu/@visible)">
                                          <td item-name="submenu" item-type="text" data-row="{position()}" data-title="{../../label/submenu}">
                                            <span>
                                              <xsl:value-of select="submenu"/>
                                            </span>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="submenu/@visible = 'false'">
                                          <input type="hidden" name="p_submenu_fk" value="submenu"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="desc_servico">
                                        <xsl:if test="not(desc_servico/@visible)">
                                          <td item-name="desc_servico" item-type="icon" data-row="{position()}" data-title="{../../label/desc_servico}">
                                            <span>
                                              <xsl:value-of select="desc_servico"/>
                                            </span>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="desc_servico/@visible = 'false'">
                                          <input type="hidden" name="p_desc_servico_fk" value="desc_servico"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="link_servico">
                                        <xsl:if test="not(link_servico/@visible)">
                                          <td item-name="link_servico" item-type="link" data-row="{position()}" data-title="{../../label/link_servico}">
                                            <xsl:choose>
                                              <xsl:when test="link_servico != ''">
                                                <a href="{link_servico}" class="link bClick" name="link_servico" target="_blank">
                                                  <xsl:value-of select="link_servico_desc" disable-output-escaping="yes"/>
                                                </a>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                <span>
                                                  <xsl:value-of select="link_servico_desc" disable-output-escaping="yes"/>
                                                </span>
                                              </xsl:otherwise>
                                            </xsl:choose>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="link_servico/@visible = 'false'">
                                          <input type="hidden" name="p_link_servico_fk" value="link_servico"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <input type="hidden" name="p_lista_servicos_id" value="{lista_servicos_id}"/>
                                      <input type="hidden" name="p_menu_id_fk" value="{menu_id}"/>
                                      <input type="hidden" name="p_menu_id_fk_desc" value="{menu_id_desc}"/>
                                      <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                      <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
                                      <input type="hidden" name="p_tipo_menu_serv_fk" value="{tipo_menu_serv}"/>
                                      <input type="hidden" name="p_tipo_menu_serv_fk_desc" value="{tipo_menu_serv_desc}"/>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <xsl:call-template name="IGRP-bottom"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js"/>
        
        <script type="text/javascript" src="{$path}/plugins/sortable/sortable.js"/>

        <script type="text/javascript" src="{$path}/app/SA/js/utils.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/app.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/dragndrop.js"/>



      </body>
    </html>
  </xsl:template>

  <xsl:include href="tmpl/SA.includes.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
