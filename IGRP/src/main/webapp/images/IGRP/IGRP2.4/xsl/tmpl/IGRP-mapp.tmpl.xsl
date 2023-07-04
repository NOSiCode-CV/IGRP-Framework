<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

      
  <xsl:template name="igrp-mapp">
    
    <xsl:param name="url"/>

    <xsl:variable name="mapURL">
      <xsl:choose>
        <xsl:when test="contains($url,'http://') or contains($url,'https://') ">
          <xsl:value-of select="$url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>/IGRP/images/IGRP/IGRP2.3/xml/gis/map.xml</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="map" select="document($mapURL)/map"/>

    <xsl:variable name="color">
      <xsl:choose>
        <xsl:when test="style"><xsl:value-of select="style"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="'blue'"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="ispreview" select="$map/@preview"/>
  
    <xsl:choose>

      <xsl:when test="$map and $map != '' and not($ispreview) ">
        
        <xsl:variable name="mappWidgets" select="widgets"/>

      </xsl:when>

      <xsl:otherwise>

        <div class="clear" style="padding:10px;"><xsl:text>Erro ao carregar mapa...</xsl:text></div>
      
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>

  <xsl:template name="igrp-mapp-old">
    
    <xsl:param name="url"/>

    <xsl:variable name="mapURL">
      <xsl:choose>
        <xsl:when test="contains($url,'http://') or contains($url,'https://') ">
          <xsl:value-of select="$url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>/IGRP/images/IGRP/IGRP2.3/xml/gis/map.xml</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="map" select="document($mapURL)/map"/>

    <xsl:variable name="color">
      <xsl:choose>
        <xsl:when test="style"><xsl:value-of select="style"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="'blue'"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="ispreview" select="$map/@preview"/>
  
    <xsl:choose>

      <xsl:when test="$map and $map != '' and not($ispreview) ">
        
        <xsl:variable name="mappWidgets" select="widgets"/>

        <includes>
          
          <link href="{$path}/plugins/redgis/n_esri/css/esri.css" rel="stylesheet"/>
          <link rel="stylesheet" href="//js.arcgis.com/3.10/js/dojo/dijit/themes/claro/claro.css"/>
          <link href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
          <link href="{$path}/plugins/redgis/n_esri/css/redgisapp.css" rel="stylesheet"/>
          <link href="{$path}/plugins/redgis/n_esri/widgets/css/widgets.css" rel="stylesheet"/>
          <link href="{$path}/plugins/redgis/n_esri/widgets/css/steps.config.css" rel="stylesheet"/>
          <link href="{$path}/plugins/redgis/n_esri/css/{$color}.css" rel="stylesheet"/>

         <!--  <script>
         	  jQ = $;
          </script> -->
          <script src="{$path}/plugins/redgis/n_esri/js/jquery-1.9.1.min.js"></script>  
          <script>
        
            jQ = $.noConflict();
            
            $ = null;

            var path = '<xsl:value-of select="$path"/>';

          </script> 

          <!-- <script src="{$path}/plugins/redgis/n_esri/js/jquery-ui.js"></script> -->
          <script src="{$path}/plugins/redgis/n_esri/js/esri.3.13.js"></script>     
          <!-- <script src="{$path}/plugins/redgis/n_esri/js/esri.js"></script>   -->     
          <script src="{$path}/plugins/redgis/n_esri/js/dojo.require.js"></script> 
          <script src="{$path}/plugins/redgis/n_esri/js/mapp.library.js"></script> 
          <script src="{$path}/plugins/redgis/n_esri/js/mapp.js"></script> 
          <script src="{$path}/plugins/redgis/n_esri/js/Widgets.js"></script> 
          <script src="{$path}/plugins/redgis/n_esri/js/LayersManager.js"></script> 
          <script src="{$path}/plugins/redgis/n_esri/js/Geometry.js"></script>           
        </includes>

        <img src="{$path}/plugins/redgis/n_esri/img/loading.gif" id="loading"/>

        <div id="mapp-holder">
          <mapp path="{$path}" template="{$color}" zoom="{$map/zoom}" id="mapp" mapid="{$map/id}" center_long="{$map/center/long}" center_lat="{$map/center/lat}">
            <mapdata class="layers-controller" alpha="template" >
              <token><xsl:value-of select="$map/token"/></token>
              <xsl:if test="$map/layers">
                <layers class="data-content" >
                  <xsl:for-each select="$map/layers/theme">
                    <div>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="layer/visible='1'">layer-theme</xsl:when>
                          <xsl:otherwise>layer-theme hidden</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <input type="checkbox" class="check-all-layers"/>
                      <h3 class="theme-name"><xsl:value-of select="name"/></h3>
                      <xsl:for-each select="layer">
                        <xsl:variable name="layerId" select="id"/>
                        <layer id="{id}" type="{type}" url="{url}" editable="{editable}" label="{label}" zoom="{zoom}" geometry-type="{geom_type}" wms-layers="{layers_wms}">
                        <xsl:attribute name="visible">
                        <xsl:choose>
                          <xsl:when test="not(visible) or visible = ''">
                            <xsl:text>1</xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="visible"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="center">
                        <xsl:if test="center/long != '' and center/lat != ''">
                          <xsl:value-of select="concat(center/long,',',center/lat)"/>
                        </xsl:if>
                        </xsl:attribute>
                        <xsl:attribute name="hidden">
                          <xsl:choose>
                            <xsl:when test="hidden = 1"><xsl:text>true</xsl:text></xsl:when>
                          </xsl:choose>
                        </xsl:attribute>
                        <div class="layer-data" text="template">
                          <xsl:choose>
                            <xsl:when test="visible = 1">
                              <input type="checkbox" class="layer-visibility" checked="checked"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <input type="checkbox" class="layer-visibility"/>
                            </xsl:otherwise>
                          </xsl:choose>
                          <div class="layer-info">
                            <h3 class="layer-name"><xsl:value-of select="name"/></h3>
                            <div class="slider" border="template"></div>
                          </div>
                        </div>
                        <xsl:choose>
                          <xsl:when test="outfields and outfields != ''">
                            <outfields fields="{outfields}"></outfields>
                          </xsl:when>
                          <xsl:otherwise>
                            <outfields fields="*"></outfields>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="selection_symbol">
                          <selection_symbol color="{selection_symbol}"></selection_symbol>
                        </xsl:if>
                        <xsl:if test="query_expression">
                          <queries>
                            <xsl:for-each select="query_expression/query">
                              <query field="{field}" value="{value}" type="{field/@type}"></query>
                            </xsl:for-each>
                          </queries>
                        </xsl:if>
                        <xsl:if test="attribute_renderer">
                          <attrenderer>
                            <xsl:for-each select="attribute_renderer/renderer">
                              <renderer field="{field}">
                                <values>
                                  <xsl:for-each select="values/value">
                                    <info value="{.}" color="{./@color}"></info>
                                  </xsl:for-each>
                                </values>
                              </renderer>
                            </xsl:for-each>
                          </attrenderer>
                        </xsl:if>
                        </layer>
                      </xsl:for-each>
                    </div>
                  </xsl:for-each>
                  
                </layers>
              </xsl:if>
            </mapdata>
            <div id="mapdata-panel-toggle" alt="Layers" title="Layers" border="template" alpha="template" class="layers-controller">
              <div class="mapdata-t-lbl">Layers</div>
            </div>
            <tools class="active" alt="Widgets" title="Widgets"  alpha="template"> <span class="tool-control" alpha="template" shadow="true">
              <icon rel="mainmenu" class="toolsmenu"></icon>
              </span>
              <div id="tool-contents" >
                <xsl:for-each select="$mappWidgets/widget[position = 'MappTools']">
                  <div class="widget-controller" widgetid="{name}" layer="{layer}" position="MappTools"> <img src="{$path}/extentions/n_esri/widgets/img/{name}_icon.png"/>
                    <p><xsl:value-of select="label"/></p>
                  </div>
                </xsl:for-each>
              </div>
            </tools>
            <div id="mapp-fscreen-controller" alpha="template" shadow="true"> 
             <!--  <img alpha="template" src="{$path}/extentions/n_esri/img/tools/expand.png"/>  -->
            </div>
            <div id="layer-ctx-menu" menuIdx="1">
              <xsl:for-each select="$mappWidgets/widget[position = 'layermenu']">
                <div class="layer-menu" widgetid="{name}" layerid="{layer}" position="layermenu"> 
                  <img src="{$path}/extentions/n_esri/widgets/img/{name}_icon.png"/>
                  <xsl:if test="label">
                    <span><xsl:value-of select="label"/></span>
                  </xsl:if>
              </div>
              </xsl:for-each>
            </div>

            <basemap style="display:none">
              <xsl:value-of select="$map/basemap/type"/>
              <id><xsl:value-of select="$map/basemap/id"/></id>
              <name><xsl:value-of select="$map/basemap/name"/></name>
              <url><xsl:value-of select="$map/basemap/link"/></url>
              <type><xsl:value-of select="$map/basemap/type"/></type>
            </basemap>

            <div id="mapp-coords-info" text="template">
              <span id="mapp-c-x"></span>
              <span id="mapp-c-y"></span>
            </div>

          </mapp>
          <xsl:apply-templates mode="widgets_congif" select="$mappWidgets"/>
          <div id="mapp-error-handler">
            <div class="inner-padding-10">
              <p id="mapp-error-message"></p>
            </div>
          </div>
          <div class="black-out"></div>
          <div class="mapp-external-holder" border="template">
            <div class="closer"></div>
            <iframe src="" sandbox="allow-same-origin allow-pointer-lock allow-top-navigation allow-scripts allow-popups allow-forms"></iframe>
          </div>
          <div id="mapp-cert-checker">
            <!-- {layers/theme/layer/url} -->
            <div class="closer"></div>
            <div id="mapp-cert-msg" text="template">
              <p>Se as camadas nao foram carregadas, clique <a href="https://rai-gv-gis-02.gov.cv:6443/arcgis/rest" target="blank">aqui</a>, aceite o certificado e depois recarregue o mapa.</p>
              <p id="reloader">Recarregar Mapa</p>
            </div>
          </div>
          <script>
           jQ('#mapp').mapp();
         </script> 
        </div>
        
        <script>
            <!-- $ = jqBK;
           // var path = '<xsl:value-of select="$path"/>';
           console.log(jqBK) -->
        </script> 

      </xsl:when>

      <xsl:otherwise>

        <div class="clear" style="padding:10px;"><xsl:text>Erro ao carregar mapa...</xsl:text></div>
      
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>
</xsl:stylesheet>