<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="gis-map-view" >
    
    <xsl:param name="id"/>

    <xsl:param name="data"/>

    <xsl:choose>

      <xsl:when test="$id">

        <div class="igrp-map-os-wrapper" id="{$id}">
         		
		  <div class="gis-panel widget"></div>
		
          <div class="gis-panel left">
            
            <div class="btn-group-vertical gis-panel-inner" role="group" >
              <button type="button" class="btn btn-default gis-zoom-in" text-color="primary">
                <i class="fa fa-plus"></i>
              </button>
              <button type="button" class="btn btn-default gis-zoom-home" text-color="primary">
                <i class="fa fa-home"></i>
              </button>
              <button type="button" class="btn btn-default gis-zoom-out" text-color="primary">
                <i class="fa fa-minus"></i>
              </button>
            </div>
            
            <div class="btn-group-vertical gis-panel-inner" role="group" >
              <button type="button" class="btn btn-default gis-layers-controller" rel="layers" text-color="primary">
                <i class="fa fa-list"></i>
              </button>
              <div class="gis-panel-menu-content h-100 p-0" rel="layers">
                <ul class="nav nav-tabs">
                  <li>
                    <a data-toggle="tab" href="#gis-basemaps-{$id}" active-text-color="primary"><i class="fa fa-globe"></i></a>
                  </li>
                  <li class="active">
                    <a data-toggle="tab" href="#gis-layers-{$id}" active-text-color="primary"><i class="fa fa-navicon"></i></a>
                  </li>
                </ul>
                <div class="tab-content">
                  <div id="gis-basemaps-{$id}" class="tab-pane fade gis-basemaps"></div>
                  <div id="gis-layers-{$id}" class="tab-pane fade gis-layers in active">
                    <div class="layers-wrapper hidden">
                      <div class="layers-data"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            	
            <div class="gis-widgets-controller"></div>
            
          </div>

          <div class="gis-panel right"></div>
          
          <div class="gis-panel bottom">
          
           <div  type="button" class="btn-group-vertical gis-panel-inner" role="group">
          	  <button class="gis-lock-bounds btn btn-default" id="gis-lock-bounds"  text-color="primary">
	          	<i class="fa fa-unlock"></i>
	          </button>
	       </div>
          	
          	<div  type="button" class="btn-group-vertical gis-panel-inner" role="group">
          	  <button class="gis-locate btn btn-default"  text-color="primary">
	          	<i class="fa fa-compass"></i>
	          </button>
	       </div>
	       
	       <div  type="button" class="btn-group-vertical gis-panel-inner" role="group">
              <button class="gis-expand btn btn-default"  text-color="primary">
	          	<i class="fa fa-expand"></i>
	          </button>
            </div>
          
          </div>
          
          <div class="gis-footer-controller">
          	<div class="footer-panel">
          		<div class="gis-attribution"></div>          		
          		<div id="gis-mouse-position">0,0</div>  
          		<div class="gis-scale">
          			<span id="gis-scale-label"></span>
          			<div id="gis-scale-ruler"></div>
          		</div>        		
          	</div>          	
          </div>
          
          <div id="{$id}-map" class="gis-map-view" style="min-height:650px"></div>

          <xsl:if test="$data">
            <script>$('#<xsl:value-of select="$id"/>').data('configURL', '<xsl:value-of select="$data"/>')</script>
          </xsl:if>
          
        </div>

      </xsl:when>

      <xsl:otherwise>
        <p>No ID provided</p>
      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>


  <xsl:template name="gis-map-view-old" >

  	<xsl:param name="id" select="'map_os'"/>

    <xsl:param name="type" select="'leaflet'"/>

    <xsl:param name="dataJSON"/>

    <xsl:param name="dataXML"/>

    <div class="igrp-gis-map" id="{$id}" map-type="{$type}" >

      <xsl:if test="$dataJSON">

        <xsl:attribute name="map-data-url"><xsl:value-of select="$dataJSON"/></xsl:attribute>

      </xsl:if>

      <xsl:if test="$dataXML">

        <xsl:attribute name="map-data-xml"><xsl:value-of select="$dataXML"/></xsl:attribute>

      </xsl:if>

    </div>

  </xsl:template>

</xsl:stylesheet>