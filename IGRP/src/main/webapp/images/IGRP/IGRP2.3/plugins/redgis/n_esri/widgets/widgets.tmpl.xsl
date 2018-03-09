<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:variable name="widgets_path" select="'../../../extentions/n_esri/widgets'"/>
  
  <xsl:template name="widgets_congif" mode="widgets_congif" match="widgets">
    <widgets>
      <xsl:for-each select="widget">
        <xsl:choose>
          <xsl:when test="name = 'polygonSimpleMenu'">
            <xsl:apply-templates mode="polygonSimpleMenu" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'advancedInfoWindow'">
            <xsl:apply-templates mode="advancedInfoWindow" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'IGRPCoordsReturn'">
            <xsl:apply-templates mode="IGRPCoordsReturn" select="." />
            
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </widgets>
  </xsl:template>
  
  <!--SIMPLE MENU-->
  <xsl:template name="polygonSimpleMenu" mode="polygonSimpleMenu" match="widget">
    <widget wId="{name}" class="feature-options" id="{name}">
      <div class="wcontent">
        <infomenu class="layer-actions">
          <xsl:for-each select="items/menu">
            <menu alt="{label}" title="{label}" idx="{position()}" actionid="{actionid}" url="{url}" target="{target}"><a class="menu-item"><img src="{$widgets_path}/img/{actionid}.png"/></a></menu>
          </xsl:for-each>
          <div class="clear"></div>
        </infomenu>
        <div class="clear"></div>
        <div class="clear"></div>
      </div>
      <script src="{$widgets_path}/js/{name}.js"></script>
      <script>
   var wId = "<xsl:value-of select='./name'/>";
	$('widget[wId="'+wId+'"]').LayerSimpleMenu();
   </script>
    </widget>
  </xsl:template>
  <!--ADVANCED INFO WINDOW-->
  
  <xsl:template name="advancedInfoWindow" mode="advancedInfoWindow" match="widget">
    <widget wId="{name}" id="{name}">
      <div class="wcontent">
      <div id="advancedWindowObjControl">
          <ul>
            <li control="total-selected"><span class="lbl">Selecionados</span><span class="value"></span><div class="clear"></div></li>
          </ul>
        </div>
        <ul>
          <xsl:for-each select="layer/fields/field">
            <li class="field-name" field="{name}" operation="{operation}" position="{position()}"><span class="lbl"><xsl:value-of select="label"/></span><span class="field-value value" field="{name}"></span><div class="clear"></div></li>
          </xsl:for-each>
        </ul>
        <div class="clear"></div>
      </div>
      <script src="{$widgets_path}/js/{name}.js"></script>
      <script>
   var wId = "<xsl:value-of select='./name'/>";
	$('widget[wId="'+wId+'"]').AdvancedInfoWindow();
   </script>
    </widget>
  </xsl:template>
  
  <!--IGRP COORDINATES RETURN-->
  <xsl:template name="IGRPCoordsReturn" mode="IGRPCoordsReturn" match="widget">
    <widget wId="{name}" id="{name}" type="{type}" marker="{$path}/img/map/{rows/content/form/value/marker}.png" state="{state}">
      <div class="wcontent">
      	<div class="locator" id="mapp_locator">
        	<img src="{$widgets_path}/img/locator.png"/>
            <div class="locator-lbl">Minha Localização</div>
        </div>
      	<div class="points-controller">
            <input type="hidden" value="" class="igrp-return-value"/>
            <menu class="igrp-coords-return returnBtn" title="Confirmar" alt="Confirmar" >
            	<a class="menu-item"><img src="{$widgets_path}/img/confirm.png"/></a>
            </menu>
            <menu class="point-reset returnBtn" title="Remarcar" alt="Remarcar">
            	<a class="menu-item"><img src="{$widgets_path}/img/remark.png"/></a>
            </menu>
            <div class="coordinates-info"></div>
      	</div>
      </div>
	  <script src="{$widgets_path}/js/{name}.js"></script>
      <script>
      	 var wId = "<xsl:value-of select='./name'/>";
	     $('widget[wId="'+wId+'"]').IGRPCoordsReturn();
      </script>
      
    </widget>
  </xsl:template>
  
</xsl:stylesheet>