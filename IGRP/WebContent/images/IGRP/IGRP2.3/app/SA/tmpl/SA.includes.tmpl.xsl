<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="SA-sidebar">
        <xsl:param name="drag" select="false()"/>

        <xsl:variable name="drag-class">
            <xsl:if test="$drag">drag-handler</xsl:if>
        </xsl:variable>

        <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar">
          
          <div class="sa-sidebar-search col-md-2 col-sm-3" bg-color="1">
            <div class="input-group">
              <input type="text" id="sa-service-searcher" class="form-control" placeholder="Pesquisar..."/>
              <span class="input-group-btn">
                <button class="btn btn-transparent" type="button"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </div>

          <ul class="nav nav-sidebar" id="sa-service-list" style="clear:both">
            <xsl:for-each select="rows/content/form/table/lista_servicos/value/row[not(@total='yes')]/menu_id[not(.=preceding::*)]">
              <xsl:variable name="menuid" select="."/>
              <xsl:variable name="menu" select=".."/>
              <xsl:variable name="submenus" select="../../row[not(@total='yes')][menu_id = $menuid]"/>
              <li>
                <xsl:if test="$submenus">
                  <xsl:attribute name="class">treeview</xsl:attribute>
                </xsl:if>
                
                <a href="#" class="service-parent">
                  <xsl:value-of select="$menu/menu"/>
                  <i class="fa fa-angle-right pull-right"></i>
                  <span class="nav-bar-active"/>
                </a>

                <xsl:if test="$submenus">
                  <ul class="treeview-menu">
                    <xsl:for-each select="$submenus">
                      <li class="parent-services" data-icon="{icon_serv}" data-id="{id_servico}" data-menu-type="{tipo_menu_serv}">
                        <a href="{link_servico}" class="service-item {$drag-class} btn-services" target="_blank">
                          <i class="fa fa-angle-right"></i>
                          <span class="card-text"><xsl:value-of select="submenu"/></span>
                          <span class="app-info"><xsl:value-of select="info_serv"/></span>
                        </a>
                      </li>
                    </xsl:for-each>
                  </ul>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
          <xsl:if test="rows/content/form/label/data">
            <div class="data_atend col-md-2 col-sm-3">
              <span><xsl:value-of select="rows/content/form/value/hidden[@name='p_dia']/text()"/></span>
              <span><xsl:value-of select="rows/content/form/value/data"/></span>
            </div>
          </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="SA-toolbar">
        <div class="sa-toolbar clearfix">
         <ul class="nav navbar-nav navbar-right">
           <li>
              <span class="time-title"><i class="fa fa-clock-o"></i>Tempo Decorrido</span>
              <div id="sa-time-tracker" text-color="1">
                <div id="hour">00</div>
                <div class="divider">:</div>
                <div id="minute">00</div>
                <div class="divider">:</div>
                <div id="second">00</div>                
              </div>
            </li>
            <li><a href="{rows/content/form/value/link_pause}" data-toggle="tooltip" title="{rows/content/form/label/link_pause}" class="btn-toolbar" action="pause">
              <!--fa-pause-circle-o-->
              <i class="fa fa-stop-circle-o"></i></a>
            </li>
            <li>
              <a href="{rows/content/form/value/link_terminar_atend}" data-toggle="tooltip" title="{rows/content/form/label/link_terminar_atend}" class="btn-toolbar" action="finish">
                <!--glyphicon glyphicon-copy-->
                <i class="fa fa-fast-forward"></i>
              </a>
            </li>
         </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>