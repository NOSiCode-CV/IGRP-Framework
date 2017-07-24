<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="bpmn" mode="bpmn" match="content">
    <link media="all" type="text/css" href="{$path}/extensions/bpmn/css/BPMN.css" rel="stylesheet"/>
    <script type="text/javascript" src="{$path}/extensions/bpmn/release/go.js"></script>
    <script type="text/javascript" src="{$path}/extensions/bpmn/js/DrawCommandHandler.js"></script>
    <script type="text/javascript" src="{$path}/extensions/bpmn/js/BPMNClasses.js"></script>
    <script type="text/javascript" src="{$path}/extensions/bpmn/js/BPMN.js"></script>
    <script type="text/javascript" src="{$path}/extensions/bpmn/js/BPMN.init.js"></script>
    <script type="text/javascript">
      var vUrlGlob = '<xsl:value-of select="//rows/content/form/value/extra_link"/>';
      var vUrlLinkSave = '<xsl:value-of select="//rows/content/form/value/link_save"/>';
    </script>
    <div class="col">
      <div id="currentFile">(Unsaved File)</div>
      <xsl:apply-templates mode="tools-bar" select="form/tools-bar">
        <xsl:with-param name="vClassClick" select="'bClickBpmn'"/>
      </xsl:apply-templates>
      <xsl:if test="form/label/env_fk">
        <div class="apps-selector" item-name="env_fk">
          <div class="igrp_item select">
            <label>
              <xsl:if test="string-length(form/label/env_fk) > 45">
                <xsl:attribute name="title">
                  <xsl:value-of select="form/label/env_fk"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="form/label/env_fk"/>
            </label>
            <select name="{form/list/env_fk/@name}" chosen="select" id="{form/list/env_fk/@name}" data-placeholder="{form/list/env_fk/option[position() = 1]}" class="select bpmnApp">
              <option value=""/>
              <xsl:for-each select="form/list/env_fk/option[position() != 1]">
                <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/>
                </option>
              </xsl:for-each>
            </select>
            <div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div>
      </xsl:if>
    </div>
    
    <div class="box-content resetPadding">
      <div id="PaletteAndDiagram">
        <div id="sideBar">
          <!-- <div class="handle">Palette:</div> -->
          <div id="tabsMenu">
            <ul class="IGRP-menu" id="tabs">
              <xsl:for-each select="menu/item">
                <li rel="tab{position()}">
                  <xsl:if test="position() = 1">
                    <xsl:attribute name="class">active</xsl:attribute>
                  </xsl:if>
                  <a><span><xsl:value-of select="title"/></span></a>
                </li>
              </xsl:for-each>
              <div class="_clear"/>
            </ul>
            <div class="itemTab">
              <div class="IGRP-menu groupItemTab itemMenu active" id="tab1" type="tab">
                
                <div class="col">
                  <a class="addArea" title="{$lngPath/js_messages/message[@name ='add']} Área">
                    <img src="{$path_tmpl}/img/icon/tools-bar/add.png"/>
                  </a> 
                </div>
                <div class="col" id="listProcess">
                  <xsl:apply-templates mode="tree-menu" select="table"/>
                </div>
              </div>
              <div class="IGRP-menu groupItemTab itemMenu" id="tab2" type="tab">
                <div id="myPalette" ></div>
                <!-- <div class="handle">Overview:</div> -->
                
              </div>
              <div class="_clear"/>
            </div>
            <div class="_clear"/>
          </div>
          <div class="overviw">
            <a class="cOverviw">Over View</a>
            <div id="myOverview"></div>
          </div>
        </div>
        <div id="myDiagram"></div>
        <div class="bpmn_loading"/>
        <ul class="contextMenu ctxBpmn" id="ctx-bpnm-event">
          <!-- <li class="operationTable activity">
            <a type="default" href="2">Add Email Event</a>
          </li>
          <li class="operationTable activity">
            <a type="default" href="3">Add Timer Event</a>
          </li>
          <li class="operationTable activity">
            <a type="default" href="4">Add Escalation Event</a>
          </li>
          <li class="operationTable activity">
            <a type="default" href="7">Add Error Event</a>
          </li> -->
          <xsl:for-each select="//rows/content/form/table/context_menu/value/row[ctx_tipo !='line']">
            <li class="operationTable">
              <a href="{ctx_link}"><xsl:value-of select="ctx_nome"/></a>
            </li>
          </xsl:for-each>
        </ul>
        <ul class="contextMenu ctxBpmn" id="ctx-bpnm-line">
          <!-- <li class="operationTable"><a type="default" href="default">Default Flow</a></li>
          <li class="operationTable"><a type="default" href="conditional">Conditional Flow</a></li> -->
          <xsl:for-each select="// rows/content/form/table/context_menu/value/row[ctx_tipo ='line']">
            <li class="operationTable">
              <a  href="{ctx_link}"><xsl:value-of select="ctx_nome"/></a>
            </li>
          </xsl:for-each>
        </ul>
      </div>
      <div class="_clear"/>
    </div>
    <div class="dataJSON" id="dataJSON">
      <textarea id="mySavedModel" style="width: 100%; height: 300px">
        {"class":"go.GraphLinksModel",
          "linkFromPortIdProperty":"fromPort",
          "linkToPortIdProperty":"toPort",
          "modelData":{"position":"230 200"},
          "nodeDataArray":[<xsl:value-of select='form/value/nodedata'/>],
          "linkDataArray":[<xsl:value-of select='form/value/linkdata'/>]
        }
      </textarea>
    </div>
  </xsl:template>  
  <xsl:include href="IGRP-tree-menu.tmpl.xsl?v=1"/>
</xsl:stylesheet>