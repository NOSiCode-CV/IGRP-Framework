<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="igrp-mapp">
    <xsl:param name="url"/>
      
    <xsl:variable name="map" select="document($url)/map"/>

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
          </script>  -->
          <!-- <script src="{$path}/plugins/redgis/n_esri/js/jquery-1.9.1.min.js"></script>  -->
          <script>
            jQ = $;
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
        
        

      </xsl:when>

      <xsl:otherwise>

        <div class="clear" style="padding:10px;"><xsl:text>Erro ao carregar mapa...</xsl:text></div>
      
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>
</xsl:stylesheet>