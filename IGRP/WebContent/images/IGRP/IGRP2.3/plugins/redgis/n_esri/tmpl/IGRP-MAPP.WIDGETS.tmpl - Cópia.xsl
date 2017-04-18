<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1"/>
  <xsl:template name="widgets_congif" mode="widgets_congif" match="widgets">
    <xsl:variable name="widgets_path" select="''"/>
    <xsl:value-of select="$widgets_path"/>
    <widgets>
      <xsl:for-each select="widget">
        <xsl:choose>
          <xsl:when test="name = 'advancedInfoWindow'">
            <xsl:apply-templates mode="WIDGET_advancedInfoWindow" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'IGRPCoordsReturn'">
            <xsl:apply-templates mode="WIDGET_IGRPCoordsReturn" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'polygonEdition'">
            <xsl:apply-templates mode="WIDGET_polygonEdition" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'externalWindow'">
            <xsl:apply-templates mode="WIDGET_externalWindow" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'pesquisadefault'">
            <xsl:apply-templates mode="WIDGET_pesquisadefault" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'pesquisabd'">
            <xsl:apply-templates mode="WIDGET_pesquisabd" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'basemap'">
            <xsl:apply-templates mode="WIDGET_basemap" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'attributerender'">
            <xsl:apply-templates mode="WIDGET_attributerender" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'selectionmenu'">
            <xsl:apply-templates mode="WIDGET_selectionmenu" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'desanexacao'">
            <xsl:apply-templates mode="WIDGET_desanexacao" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'legendadefault'">
            <xsl:apply-templates mode="WIDGET_legendadefault" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'queryexpression'">
            <xsl:apply-templates mode="WIDGET_queryexpression" select="." />            
          </xsl:when>
          <xsl:when test="name = 'pesquisaigrp'">
            <xsl:apply-templates mode="WIDGET_pesquisaigrp" select="." />            
          </xsl:when>

          <xsl:when test="name = 'featureeditdb'">
            <xsl:apply-templates mode="WIDGET_featureeditdb" select="." />            
          </xsl:when>

        </xsl:choose>
      </xsl:for-each>
    </widgets>
  </xsl:template>
  
  <!-- EXTERNAL WINDOW -->
  <xsl:template name="WIDGET_externalWindow" mode="WIDGET_externalWindow" match="widget">
    <widget wId="{name}" id="{name}_{layer}" layer="{layer}">
      <script>
	    var wId = "<xsl:value-of select='./name'/>_<xsl:value-of select='./layer'/>";
		var teste = new ExternalWindow(jQ('widget[wId="'+wId+'"]'))
		//$('widget[wId="'+wId+'"]').ExternalWindow();
	  </script>
    </widget>
  </xsl:template>
  
  <!-- BASE MAP CHANGE -->
  <xsl:template name="WIDGET_basemap" mode="WIDGET_basemap" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div class="basemaps-holder">
        <xsl:for-each select="widgetcontent/basemap">
          <div class="basemap-item" id="{id}" type="{type}" link="{link}" name="{name}">
            <div class="content-inner">
              <div class="basemap-img">
                <h3 class="basemap-title"><span><xsl:value-of select="name"/></span>
                  <div class="status"></div>
                </h3>
                <img src="{$path}/extentions/n_esri/widgets/img/basemap/{name}.jpg"/></div>
            </div>
          </div>
        </xsl:for-each>
      </div>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').BaseMap();
	  </script>
    </widget>
  </xsl:template>
  
  <!-- BASE MAP CHANGE -->
  <xsl:template name="WIDGET_attributerender" mode="WIDGET_attributerender" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}" field="{field}">
          <xsl:for-each select="values/value">
            <render color="{@color}" label="{@label}" operator="{@operator}" value="{.}"></render>
          </xsl:for-each>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').AttrRender();
	  </script>
    </widget>
  </xsl:template>
  
  <!-- PESQUISA DEFAULT -->
  <xsl:template name="WIDGET_pesquisadefault" mode="WIDGET_pesquisadefault" match="widget" >
    <widget wId="{name}" id="{name}" position="{position}">
      <div  class="submit-holder" id="pesquisadefault_submitter">
        <div class="input-holder">
          <input id="{name}_input" class="search-input padding-box" left="4" right="32" placeholder="{tooltip}"/>
          <button type="submit" class="search-btn" color="template"></button>
          <div class="clear"></div>
        </div>
        <div class="search-extra-options">
          <div class="option-holder">
            <input id="extent-checker" class="option" type="checkbox" />
            <span class="option-lbl">Na area visivel</span></div>
        </div>
      </div>
      <div class="pesquisa-results-menu">
        <ul>
        </ul>
      </div>
      <div></div>
      <div class="pesquisa-results-holder"></div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer layerid="{id}">
          <fields>
            <xsl:for-each select="fields/field">
              <field name="{.}"></field>
            </xsl:for-each>
          </fields>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').PesquisaDefault();
	  </script>
    </widget>
  </xsl:template>
  
  <!-- PESQUISA BASE DE DADOS -->
  <xsl:template name="WIDGET_pesquisabd" mode="WIDGET_pesquisabd" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div class="submit-holder" action="{widgetcontent/linkonsearch}" xslt="{$path}/extentions/n_esri/widgets/util/pesquisabd.results.tmpl.xsl">
        <div class="input-holder">
          <input class="search-input padding-box" left="4" right="32" placeholder="{tooltip}"/>
          <button type="submit" class="search-btn" color="template"></button>
          <div class="clear"></div>
        </div>
      </div>
      <div id="pesquisabd-results-holder"></div>
      <fields>
        <field id="extent" name="{widgetcontent/extent}"></field>
        <field id="activeLayers" name="{widgetcontent/activelayers}"></field>
        <field id="searchKey" name="{widgetcontent/searchkey}"></field>
        <field id="mapId" name="{widgetcontent/mapid}"></field>
      </fields>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').PesquisaBd();
	  </script>
    </widget>
  </xsl:template>
  
  <!-- LAYER MENU -->
  <xsl:template name="WIDGET_selectionmenu" mode="WIDGET_selectionmenu" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}">
          <xsl:for-each select="menu">
            <menu url="{url}" target="{target}" label="{label}" icon="{icon}"></menu>
          </xsl:for-each>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').LayerMenu();
	  </script>
    </widget>
  </xsl:template>

  <xsl:template name="WIDGET_queryexpression" mode="WIDGET_queryexpression" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
      var wId = "<xsl:value-of select='./name'/>";
     jQ('widget[wId="'+wId+'"]').QueryExpression();
    </script>
    </widget>
  </xsl:template>
  
  <!-- WIDGET ESRI LEGEND -->
  <xsl:template name="WIDGET_legendadefault" mode="WIDGET_legendadefault" match="widget">
    <link href="{$path}/extentions/n_esri/widgets/css/{name}.style.css" rel="stylesheet"/>
    <widget wId="{name}" id="{name}" position="{position}">
    
    <div id="legendadefault_holder"></div>
    <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script> 
    <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').LegendaDefault();
	  </script>
    </widget>
  </xsl:template>
  <!-- WIDGET DESANEXAR DESANEXAcaO SPLIT -->
  <xsl:template name="WIDGET_desanexacao" mode="WIDGET_desanexacao" match="widget">
    <link href="{$path}/extentions/n_esri/widgets/css/{name}.style.css" rel="stylesheet"/>
    <widget wId="{name}" id="{name}" position="{position}">
    
    <!--STEP 1 - SELECT POLYGON-->
    <div step="1" class="desanex-step">
    <div class="step-num" color="template"><span>1</span></div>
      
      <p class="step-help">Escolha o prédio a desanexar.</p>
      <p  class="step-done-info"><span class="info-label" text="template">Area: </span><span id="main-area"></span></p>
      <!-- <ul class="step-info-list"></ul> -->
      <div class="step-done-overlay"></div>
    </div>
    <!--STEP 2 - SELECT POLYGON-->
    <div step="2" class="desanex-step">
      <div class="step-num" color="template"><span>2</span></div>
      <div class="step-content">
       
        <div  method="post" id="uploadForm">
          <p class="step-help">Carregue o ShapeFile.zip</p>
          <div class="field step-help">
            <div rel="inFile" id="btn-load" text="template" class="desanex-btn">ShapeFile</div>
            <input style="display:none" type="file" name="file" id="inFile" />
          </div>
           <p  class="step-done-info"><span class="info-label" text="template">Graficos: </span><span id="total-graphs"></span></p>
           <p  class="step-done-info"><span class="info-label" text="template">Area Total: </span><span id="total-area" ></span></p>

         <!-- <p id="file-loaded" class="step-done-info"></p>-->
        </div>

        <ul class="step-info-list"></ul>
      </div>
      <div id="upload-status"></div>
      <div class="step-done-overlay"></div>
    </div>
     <!--STEP 3 - SELECT POLYGON-->
    <div step="3" class="desanex-step">
      <div class="step-num" color="template"><span>2</span></div>
      <div class="step-content"> 
      <button id="confirm-split" text="template" class="desanex-btn">Confirmar</button><button text="template"  class="desanex-btn" id="re-add-shape">Escolher outro ShapeFile</button>
      </div>
    </div>
    <layers>
      <xsl:for-each select="widgetcontent/layers/layer">
        <layer id="{id}">
          <field_main name="{field_main}"></field_main>
          <field_split name="{field_split}"></field_split>
        </layer>
      </xsl:for-each>
    </layers>
    <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script> 
    <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').Desanexacao();
	  </script> 
    </widget>
  </xsl:template>

  <!-- PEQUISA IGRP-->
  <xsl:template name="WIDGET_pesquisaigrp" mode="WIDGET_pesquisaigrp" match="widget">
    <widget wId="{name}" id="{name}" class="loading" plink="{widgetcontent/linkigrp}" position="{position}">
        <div class="pesquisaigrp-holder" border="template">
            <iframe name="ifpIgrp" id="ifpIgrp" src=""  sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
        </div>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
      var wId = "<xsl:value-of select='./name'/>";
    jQ('widget[wId="'+wId+'"]').PesquisaIGRP();
    </script>
    </widget>
  </xsl:template>

  


  <!-- FEATURE EDIT-->
  <xsl:template name="WIDGET_featureeditdb" mode="WIDGET_featureeditdb" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
       <ul class="widget-option-group">
         <li rel="add">Novo</li>
         <li rel="edit">Editar</li>
       </ul>

      <div rel="add" class="widget-option">
        
      </div>

      <div rel="edit" class="widget-option">
        <!--STEP 1 - SELECT POLYGON-->
        <div step="1" class="widget-step">
        <div class="step-num" color="template"><span>1</span></div>
          
          <p class="step-help">Escolha o prédio a Editar.</p>
          <p  class="step-done-info"><span class="info-label" text="template">ID: </span><span id="featureid"></span></p>
          <!-- <ul class="step-info-list"></ul> -->
          <div class="step-done-overlay"></div>
        </div>

     
        <div step="2" class="widget-step">
        <div class="step-num" color="template"><span>2</span></div>
         <button id="confirm-edition" text="template" class="step-btn">Confirmar</button>
          <div class="step-done-overlay"></div>
        </div>

      </div>

        <layers>
          <xsl:for-each select="widgetcontent/layers/layer">
              <layer id="{id}"></layer>
          </xsl:for-each>
      </layers>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').FeatureEditDB();
    </script>
    </widget>
  </xsl:template>
  
 



  <!-- POLYGON EDITION -->
  <xsl:template name="WIDGET_polygonEdition" mode="WIDGET_polygonEdition" match="widget">
    <widget wId="{name}" id="{name}" layer="{layer}" position="{position}">
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').PolygonEdition();
	  </script>
    </widget>
  </xsl:template>
  
  <!--ADVANCED INFO WINDOW-->
  <xsl:template name="WIDGET_advancedInfoWindow" mode="WIDGET_advancedInfoWindow" match="widget">
    <widget wId="{name}" id="{name}">
      <div class="wcontent">
        <div id="advancedWindowObjControl">
          <ul>
            <li control="total-selected"><span class="lbl">Selecionados</span><span class="value"></span>
              <div class="clear"></div>
            </li>
          </ul>
        </div>
        <ul>
          <xsl:for-each select="layer/fields/field">
            <li class="field-name" field="{name}" operation="{operation}" position="{position()}"><span class="lbl"><xsl:value-of select="label"/></span><span class="field-value value" field="{name}"></span>
              <div class="clear"></div>
            </li>
          </xsl:for-each>
        </ul>
        <div class="clear"></div>
      </div>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
	    var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').AdvancedInfoWindow();
	  </script>
    </widget>
  </xsl:template>
  
  <!--IGRP COORDINATES RETURN-->
  <xsl:template name="WIDGET_IGRPCoordsReturn" mode="WIDGET_IGRPCoordsReturn" match="widget">
    <widget wId="{name}" id="{name}" type="{type}" marker="{marker}" state="{state}">
      <div class="wcontent">
        <div class="locator" id="mapp_locator"><img src="{$path}/extentions/n_esri/widgets/img/locator.png"/>
          <div class="locator-lbl">Minha Localizacao</div>
        </div>
        <div class="points-controller">
          <input type="hidden" value="" class="igrp-return-value"/>
          <menu class="igrp-coords-return returnBtn" title="Confirmar" alt="Confirmar" ><a class="menu-item"><img src="{$path}/extentions/n_esri/widgets/img/confirm.png"/></a></menu>
          <menu class="point-reset returnBtn" title="Remarcar" alt="Remarcar"><a class="menu-item"><img src="{$path}/extentions/n_esri/widgets/img/remark.png"/></a></menu>
          <div class="coordinates-info"></div>
        </div>
      </div>
      <script src="{$path}/extentions/n_esri/widgets/js/{name}.js"></script>
      <script>
      	 var wId = "<xsl:value-of select='./name'/>";
	    jQ('widget[wId="'+wId+'"]').IGRPCoordsReturn();
      </script>
    </widget>
  </xsl:template>
</xsl:stylesheet>