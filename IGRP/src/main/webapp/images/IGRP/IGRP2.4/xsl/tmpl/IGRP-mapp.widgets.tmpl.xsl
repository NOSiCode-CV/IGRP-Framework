<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1"/>
  <xsl:template name="widgets_congif" mode="widgets_congif" match="widgets">
    <xsl:variable name="widgets_path" select="''"/>
    <xsl:value-of select="$widgets_path"/>
    <widgets>
      <xsl:for-each select="widget">
        <xsl:choose>

          <xsl:when test="name = 'timeslider'">
           <xsl:apply-templates mode="WIDGET_timeSlider" select="."/>
         </xsl:when>

          <xsl:when test="name = 'advancedInfoWindow'">
            <xsl:apply-templates mode="WIDGET_advancedInfoWindow" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'infowindowesri'">
            <xsl:apply-templates mode="WIDGET_infowindowesri" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'IGRPCoordsReturn'">
            <xsl:apply-templates mode="WIDGET_IGRPCoordsReturn" select="." />
            
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
          <xsl:when test="name = 'anexacao'">
            <xsl:apply-templates mode="WIDGET_anexacao" select="." />
            
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
          <xsl:when test="name = 'infowindowdb'">
            <xsl:apply-templates mode="WIDGET_infowindowdb" select="." />
            
          </xsl:when>
          <xsl:when test="name = 'medicao'">
            <xsl:apply-templates mode="WIDGET_medicao" select="." />
            
          </xsl:when>

          <xsl:when test="name = 'dropshape'">
            <xsl:apply-templates mode="WIDGET_dropshape" select="." />
            
          </xsl:when>

          <xsl:when test="name = 'reportespacial'">
            <xsl:apply-templates mode="WIDGET_reportespacial" select="." />
            
          </xsl:when>

        </xsl:choose>
      </xsl:for-each>
    </widgets>
  </xsl:template>

  <!--TIMESlIDER-->
  <xsl:template name="WIDGET_timeSlider" mode="WIDGET_timeSlider" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div class="ts ">
        <div class="informacoes">
          <div class="infosep">INTERVALO DE TEMPO:  <span id="daterange"><b class="start"><xsl:value-of select="widgetcontent/timeextent/starttime"/></b> ate <b class="end"> <xsl:value-of select="widgetcontent/timeextent/endtime"/></b></span> </div>
          <div id="timeSliderDiv"></div>
        </div>
      </div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer url="{url}" thumbcount="{thumbcount}" id="{id}" ></layer>

        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').timeSlider({
          starttime  : '<xsl:value-of select="widgetcontent/timeextent/starttime"/>',
          endtime    : '<xsl:value-of select="widgetcontent/timeextent/endtime"/>',
          thumbcount :  <xsl:value-of select="widgetcontent/thumbcount"/>,
          thumbmovingrate: <xsl:value-of select="widgetcontent/thumbmovingrate"/>,
          timestopsinterval: <xsl:value-of select="widgetcontent/timestopsinterval"/>,
          startindexe: <xsl:value-of select="widgetcontent/thumbindexes/startindexe"/>,
          endindexe: <xsl:value-of select="widgetcontent/thumbindexes/endindexe"/>,
          loop: <xsl:value-of select="widgetcontent/loop"/>,
          timestopsunits : '<xsl:value-of select="widgetcontent/timestopsunits"/>',
          date_attr: '<xsl:value-of select="widgetcontent/layers/layer/date_attr"/>'
        });
      </script>
    </widget>
  </xsl:template>

  <!--BASE MAP CHANGE-->
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
                <img src="{$path}/plugins/redgis/n_esri/widgets/img/basemap/{name}.jpg"/></div>
            </div>
          </div>
        </xsl:for-each>
      </div>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
			var wId = "<xsl:value-of select='./name'/>";
			jQ('widget[wId="'+wId+'"]').BaseMap();
      </script>
    </widget>
  </xsl:template>
  <!--END OF BASE MAP CHANGE-->
  <!--ATTRIBUTE RENDERER-->
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
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
		    jQ('widget[wId="'+wId+'"]').AttrRender();
      </script>
    </widget>
  </xsl:template>
  <!--END OF ATTRIBUTE RENDERER-->
  <!--PESQUISA DEFAULT-->
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
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
		    jQ('widget[wId="'+wId+'"]').PesquisaDefault();
 	  </script>
    </widget>
  </xsl:template>
  <!--END OF PESQUISA DEFAULT-->
  <!--PESQUISA BASE DE DADOS-->
  <xsl:template name="WIDGET_pesquisabd" mode="WIDGET_pesquisabd" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div class="submit-holder" action="{widgetcontent/linkonsearch}" xslt="{$path}/plugins/redgis/n_esri/widgets/util/pesquisabd.results.tmpl.xsl">
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
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
		    jQ('widget[wId="'+wId+'"]').PesquisaBd();
      </script>
    </widget>
  </xsl:template>
  <!--END OF PESQUISA BASE DE DADOS-->
  <!--LAYER MENU-->
   <xsl:template name="WIDGET_selectionmenu" mode="WIDGET_selectionmenu" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}">
          <xsl:for-each select="menu">
            <menu url="{url}" target="{target}" label="{label}" icon="{icon}" param-name="{param_name}" param-value="{param_value}" attr-name="{attr_name}"></menu>
          </xsl:for-each>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').LayerMenu();
      </script>
    </widget>
  </xsl:template>
  <!--END OF LAYER MENU-->
  <!--WIDGET QUERY EXPRESSION-->
  <xsl:template name="WIDGET_queryexpression" mode="WIDGET_queryexpression" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
		 jQ('widget[wId="'+wId+'"]').QueryExpression();
      </script>
    </widget>
  </xsl:template>
  <!--END OF WIDGET QUERY EXPRESSION-->
  <!--WIDGET ESRI LEGEND-->
  <xsl:template name="WIDGET_legendadefault" mode="WIDGET_legendadefault" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div id="legendadefault_holder"></div>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').LegendaDefault();
      </script>
    </widget>
  </xsl:template>
  <!--END OF WIDGET ESRI LEGEND-->
  <!--WIDGET DESANEXAR DESANEXACAO SPLIT-->
  <xsl:template name="WIDGET_desanexacao" mode="WIDGET_desanexacao" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div rel="get" class="widget-option active">
        <div step="1" class="widget-step">
          <p class="step-help">Escolha o poligono a desanexar.</p>
          <p  class="step-done-info"><span class="info-label" text="template">Area:</span><span id="main-area" class="step-info-text"></span></p>
          <div class="step-done-overlay"></div>
        </div>
      </div>
      <div rel="tool" class="widget-option active">
        <div step="1" class="widget-step">
          <!--
                    <p class="step-help">Escolha a ferramenta de desanexacao.</p>-->
          <div text="template" id="draw-split" class="desanex-btn">Split</div>
          <div rel="inFile" id="btn-load" text="template" class="desanex-btn">ShapeFile</div>
          <div  method="post" id="uploadForm">
            <!--
                        <div id="upload-status"></div>-->
            <input style="display:none" type="file" name="file" id="inFile" />
          </div>
        </div>
      </div>
      <div rel="shapefile" class="widget-option active">
        <div step="1" class="widget-step">

          <h3 class="sf-g-up-title" text="template">Uploaded Shapes Area</h3>
          <div id="sf-graphcs-info">
            
          </div>

          <hr/>

          <p  class="step-done-info"><span class="info-label" text="template">Graficos:</span><span id="total-graphs" class="step-info-text"></span></p>
          <p  class="step-done-info"><span class="info-label" text="template">Area Total:</span><span id="total-area" class="step-info-text"></span></p>



        </div>
        <div step="2" class="widget-step confirmation">
          <div class="step-content">
            <button id="confirm-split" text="template" class="desanex-btn">Confirmar</button>
            <button text="template"  class="desanex-btn" id="cancel">Cancelar</button>
          </div>
        </div>
      </div>
      <div rel="draw" class="widget-option active">
        <div step="1" class="widget-step">
          <p class="step-help">Clique para comecar a desenhar.</p>
        </div>
        <div step="2" class="widget-step confirmation">
          <p class="step-help">Clique duas vezes para finalizar.</p>
        </div>
        <div step="3" class="widget-step confirmation">
          <p class="step-help">Aguarde...</p>
          <div class="step-done-info">
            <button id="confirm-draw-split" text="template" class="desanex-btn">Confirmar</button>
            <button id="cancel-draw-split" text="template"  class="desanex-btn" >Cancelar</button>
          </div>
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
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').Desanexacao();
      </script>
    </widget>
  </xsl:template>
  <!--END OF DESANEXACAO-->
  
  <!-- ANEXACAO WIDGET -->
  <xsl:template name="WIDGET_anexacao" mode="WIDGET_anexacao" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div rel="get" class="widget-option active">
        <div step="1" class="widget-step">
          <p class="step-help">Escolha os poligono que deseja anexar.</p>
          <p class="step-error">Ocorreu um erro, tente novamente.</p>
          <!--<p  class="step-done-info"><span class="info-label" text="template">Area:</span><span id="main-area" class="step-info-text"></span></p>-->
          <div class="step-done-overlay"></div>
        </div>
        
        <div step="2" class="widget-step">
            <button id="confirm-join" text="template" class="btn-1">Anexar</button>
           <!-- <button id="cancel-join" text="template"  class="btn-1" >Cancelar</button>-->
        </div>
        
        <div step="3" class="widget-step confirmation">
           <p class="step-help">Aguarde...</p>
          <div  class="step-done-info">
              <button id="confirm-anex-values" text="template" class="btn-1">Confirmar Anexacao</button>
              <button id="cancel-join" text="template"  class="btn-1" >Cancelar</button>
          </div>
        </div>
      </div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}">
            <field_child name="{field_child}"></field_child>
            <field_join name="{field_join}"></field_join>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').Anexacao();
      </script>
    </widget>
  </xsl:template>
  <!-- END OF ANEXACAO -->
  
  <!--PEQUISA IGRP-->
  <xsl:template name="WIDGET_pesquisaigrp" mode="WIDGET_pesquisaigrp" match="widget">
    <widget wId="{name}" id="{name}" class="loading" plink="{widgetcontent/linkigrp}" position="{position}">
      <div class="pesquisaigrp-holder" border="template">
        <iframe name="ifpIgrp" id="ifpIgrp" src=""  sandbox="allow-same-origin allow-scripts allow-popups allow-forms"></iframe>
      </div>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
				jQ('widget[wId="'+wId+'"]').PesquisaIGRP();
      </script>
    </widget>
  </xsl:template>
  <!--END OF PEQUISA IGRP-->
  <!--MEDICAO DEFAULT-->
  <xsl:template name="WIDGET_medicao" mode="WIDGET_medicao" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <ul class="widget-option-group">
        <li rel="area" alt="Area" title="Area"></li>
        <li rel="distance" alt="Distancia" title="Distancia"></li>
      </ul>
      <div id="measure-holder"></div>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
			jQ('widget[wId="'+wId+'"]').MeasureDefault();
      </script>
    </widget>
  </xsl:template>
  <!--FEATURE EDIT-->
   <xsl:template name="WIDGET_featureeditdb" mode="WIDGET_featureeditdb" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <ul class="widget-option-group" style="display:none">
        <li rel="add" title="Desenhar" alt="Desenhar"></li>
        <li rel="shapefile" title="Add ShapeFile" alt="Add ShapeFile"></li>
        <li rel="coords" title="Inserir coordernadas" alt="Inserir coordernadas"></li>
        <li rel="edit" title="Editar" alt="Editar"></li>
        <li rel="delete" title="Eliminar" alt="Eliminar"></li>
      </ul>
      <div id="validation-msg">A validar topologia...</div>
      <div class="mapp-layer-chooser" id="fedit-chooser">
        
        <select class="mapp-layer-chooser-select">
          <option value="">-- Escolha o layer --</option>
          <xsl:for-each select="widgetcontent/layers/layer">
            <option value="{id}"></option>
          </xsl:for-each>
        </select>
        <p id="fedit-choose-set"><span id="reset-layer" alpha="template" border="template"></span><span id="f-edit-choosed-layer"></span></p>
      </div>
     
      <div id="topo-window-tst"></div>
      <div rel="add" class="widget-option">

        <div step="1" class="widget-step confirmation">
          <p class="step-help">Clique para comecar a desenhar.</p>
          
          <div class="step-done-info">
            <button id="save-add" color="template" border="template" class="step-btn" action="accept">Gravar</button>
            <button id="cancel-add" color="template" border="template" class="step-btn" action="cancel">Cancelar</button>
          </div>
          <div class="step-done-overlay"></div>
        </div>
      </div>

      <div rel="shapefile" class="widget-option">
        <div step="1" class="widget-step">
          <div  method="post" id="f-e-uploadForm">
              <input id="f-e-file" type="file"  name="file" style="display:none"></input>
              <div id="f-e-status"></div>
          </div>
        </div>

        <div step="2" class="widget-step confirmation">
          <p class="step-help">Aguarde...</p>
          <div class="step-done-info">
            <button id="save-shapefile" color="template" border="template"  class="step-btn" action="accept">Gravar</button>
            <button id="cancel-shapefile" color="template" border="template" class="step-btn" action="cancel">Cancelar</button>
          </div>

        </div>
      </div>

      <div rel="coords" class="widget-option" alpha="template">
        <div step="1" class="widget-step confirmation">
          <!-- <p class="step-help">Insira os pontos.</p> -->
          <div id="coords-points-insert" >
              <p id="point-add-lbl">Pontos<span id="point-add"></span></p>
              <span class="coords-points-holder">
                <label>x:</label><input type="number" id="xInput"/>
              </span>
              <span class="coords-points-holder">
                <label>y:</label><input type="number" id="yInput"/>
              </span>
          
          

          </div>
          
          <ul id="point-table" alpha="template">
            
          </ul>
          
          <div class="step-done-info">
            <button id="save-coords" color="template" border="template" class="step-btn" action="accept">Gravar</button>
            <button id="cancel-coords" color="template" border="template" class="step-btn" action="cancel">Cancelar</button>
          </div>
          <div class="step-done-overlay"></div>
        </div>
      </div>

      <div rel="drop" class="widget-option">
        <div step="1" class="widget-step">
          <button id="confirm-drop" color="template" border="template" class="step-btn" action="accept">Confirmar</button>
            <button id="cancel-drop" color="template" border="template" class="step-btn" action="cancel">Cancelar</button>
        </div>
      </div>

      <div rel="edit" class="widget-option">
        <div step="1" class="widget-step">
          <p class="step-help">Escolha o prédio a Editar.</p>
          <div class="step-done-overlay"></div>
        </div>
        

        <div step="2" class="widget-step confirmation">
          <p class="step-help">Edite a forma do Poligono</p>
          <div class="step-done-info">
            <button id="confirm-edition-0" color="template" border="template" class="step-btn" action="accept">Confirmar</button>
            <!-- <button id="re-edition-0" color="template" border="template" class="step-btn" action="cancel">Editar</button> -->
          </div>
          <div class="step-done-overlay"></div>
        </div>

        <div step="3" class="widget-step confirmation">
          <div style="text-align:right">
            <button id="confirm-edition" color="template" border="template" class="step-btn" action="accept">Gravar</button>
            <button id="cancel-edition" color="template" border="template" class="step-btn" action="cancel">Cancelar</button>
          </div>

          <div class="step-done-overlay"></div>

        </div>

      </div>
      <div rel="delete" class="widget-option">
        <div step="1" class="widget-step confirmation">
          <!--
                    <div class="step-num" color="template">
                        <span>1</span>
                    </div>-->
          <p class="step-help">Escolha os predios que deseja eliminar.</p>
          <div class="step-done-info">
            <button id="confirm-delete" color="template" border="template" class="step-btn" action="cancel">Eliminar</button>
          </div>
          <div class="step-done-overlay"></div>
        </div>
        <!--
                <div step="2" class="widget-step confirmation">
                    <div class="step-done-info">
                        <button id="confirm-delete" text="template" class="step-btn">Eliminar</button>
                    </div>
                    <div class="step-done-overlay"></div>
                </div>--></div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}">
            <xsl:if test="topologyrules">
              <topologyrules usercanchange="{topologyrules/usercanchange}" validateonsubmit="{topologyrules/validateonsubmit}">
                <xsl:for-each select="topologyrules/layers/layer">
                  <layer id="{id}" name="{name}">
                      <xsl:for-each select="operations/operation">
                        <operation name="{name}" value="{value}"></operation>
                      </xsl:for-each>
                  </layer>
                </xsl:for-each>
              </topologyrules>
            </xsl:if>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').FeatureEditDB();
      </script>
    </widget>
  </xsl:template>
  <!--INFO WINDOW DB-->
  <xsl:template name="WIDGET_infowindowdb" mode="WIDGET_infowindowdb" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div id="info-holder">
        <div class="closer"></div>
        <div id="info-title">
          <h3></h3>
        </div>
        <div class="data-holder"></div>
        <div class="extra-options"><span rel="centralize">[ centralizar ]</span></div>
      </div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}" link="{link}"></layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
		    jQ('widget[wId="'+wId+'"]').InfoWindowDb();
      </script>
    </widget>
  </xsl:template>
  <!--DROP SHAPE-->
  <xsl:template name="WIDGET_dropshape" mode="WIDGET_dropshape" match="widget">
    <widget wId="{name}" id="{name}" position="{position}" style="top:20px">
      <div rel="choose" class="widget-option">
         <div step="1" class="widget-step">
           
           <div  method="post" id="d-s-uploadForm">
              <input id="d-s-file" type="file"  name="file" style="display:none"></input>
              <div id="d-s-status"></div>
           </div>
        </div>
      </div>

      <div rel="confirm" class="widget-option active">
        <div step="1" class="widget-step confirmation">
            <button id="confirm-shape" class="step-btn" action="accept">Confirmar</button>
        </div>

      </div>
     
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}"></layer>
        </xsl:for-each>
      </layers>

      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
        jQ('widget[wId="'+wId+'"]').DropShape();
      </script>
    </widget>
  </xsl:template>



  <!--INFO WINDOW ESRI-->
  <xsl:template name="WIDGET_infowindowesri" mode="WIDGET_infowindowesri" match="widget">
    <widget wId="{name}" id="{name}" position="{position}">
      <div id="iwe-window">
        <ul id="iwe-menu">
        </ul>
        <div id="iwe-f-infos"></div>
      </div>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}" title="{title}" editable="{editable}"></layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
				jQ('widget[wId="'+wId+'"]').InfoWindowEsri();
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
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
		jQ('widget[wId="'+wId+'"]').AdvancedInfoWindow();
      </script>
    </widget>
  </xsl:template>

  <xsl:template name="WIDGET_reportespacial" mode="WIDGET_reportespacial" match="widget">
    <widget wId="{name}" id="{name}" >
      <div id="report-title" color="template">
        <h2><xsl:value-of select="label"/><i rel="close" position="right"></i></h2>
      </div>
      <div id="master-info-holder" style="display:none">
        <h2 class="layer-title" text="template"><xsl:value-of select="widgetcontent/masterlayer/name"/></h2>
        <div class="layer-contents"></div>
      </div>
      <div id="others-info-holder">
        <xsl:for-each select="widgetcontent/layers/layer">
           <div class="other-layer-holder" id="{id}" name="{name}" style="display:none">
            <h2 class="layer-title" text="template"><xsl:value-of select="name"/></h2>
            <div class="layer-contents"></div>
          </div>
        </xsl:for-each>
      </div>

      <masterlayer id="{widgetcontent/masterlayer/id}">
        <fields>
          <xsl:for-each select="widgetcontent/masterattributes/field">
                <field label="{label}" value="{value}"></field>
          </xsl:for-each>
        </fields>
      </masterlayer>
      <layers>
        <xsl:for-each select="widgetcontent/layers/layer">
          <layer id="{id}" name="{name}">
            <fields>
              <xsl:for-each select="attributes/field">
                <field label="{label}" value="{value}"></field>
              </xsl:for-each>
            </fields>
          </layer>
        </xsl:for-each>
      </layers>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>
        var wId = "<xsl:value-of select='./name'/>";
        var masterLayer = "<xsl:value-of select='widgetcontent/masterlayer/id'/>";
        jQ('widget[wId="'+wId+'"]').ReportEspacial(masterLayer);
      </script>
    </widget>
  </xsl:template>


  

  <!--IGRP COORDINATES RETURN-->
  <xsl:template name="WIDGET_IGRPCoordsReturn" mode="WIDGET_IGRPCoordsReturn" match="widget">
    <widget wId="{name}" id="{name}" type="{type}" marker="{marker}" state="{state}">
      <div class="wcontent">
        <div class="locator" id="mapp_locator"><img src="{$path}/plugins/redgis/n_esri/widgets/img/locator.png"/>
          <div class="locator-lbl">Minha Localizacao</div>
        </div>
        <div class="points-controller">
          <input type="hidden" value="" class="igrp-return-value"/>
          <menu class="igrp-coords-return returnBtn" title="Confirmar" alt="Confirmar" ><a class="menu-item"><img src="{$path}/plugins/redgis/n_esri/widgets/img/confirm.png"/></a></menu>
          <menu class="point-reset returnBtn" title="Remarcar" alt="Remarcar"><a class="menu-item"><img src="{$path}/plugins/redgis/n_esri/widgets/img/remark.png"/></a></menu>
          <div class="coordinates-info"></div>
        </div>
      </div>
      <script src="{$path}/plugins/redgis/n_esri/widgets/js/{name}.js"></script>
      <script>var wId = "<xsl:value-of select='./name'/>";
			jQ('widget[wId="'+wId+'"]').IGRPCoordsReturn();
      </script>
    </widget>
  </xsl:template>
</xsl:stylesheet>