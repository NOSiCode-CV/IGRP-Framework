<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED / DIM )--><!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
    <link href="{$path}/extentions/bpmnN/css/goSamples.css" rel="stylesheet" type="text/css"/>
    <link href="{$path}/extentions/bpmnN/css/BPMN.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="{$path}/extentions/bpmnN/release/go.js"></script>
    <script src="{$path}/extentions/bpmnN/DrawCommandHandler.js"></script>
    <script src="{$path}/extentions/bpmnN/BPMNClasses.js"></script>
    <script src="{$path}/extentions/bpmnN/BPMN.js?v={$version}"></script>
    <script type="text/javascript" id="code">
		  $(document).ready(function(e) {
				//window.onload(init("myDiagram")); 
				$("#buttonSave").click(function(){
					saveModel();
					IGRP_submit($(this).attr("href"));
					//saveDocumentAs();
				});
				$("#buttonLoad").click(function(){loadModel();});
				/*$("#seletAll").click(function(e) {myDiagram.commandHandler.selectAll();});
				$("#cutAll").click(function(e) {myDiagram.commandHandler.cutSelection();});
				$("#colarAll").click(function(e) {myDiagram.commandHandler.pasteSelection();});
				$("#copyAll").click(function(e) {myDiagram.commandHandler.copySelection();});*/
		  });
 		</script>
    <body onload="init()">
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    
    
    <!--CENTER PANE-->
    <div class="general">
      <div id="content">
        <div class="ui-layout-center">
          <xsl:call-template name="dialog-modal"/>
          
          
          <!-- START YOUR CODE HERE -->
          <div class="box-content"><!--PAGE TITLE-->
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="rows/content/title"/>
              
            </xsl:call-template>
            <!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages">
              <xsl:with-param name="class" select="'notification'"/>
              
            </xsl:apply-templates>
            <!-- END NOTIFICATION MESSAGES-->
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!-- START HIDDEN FILTER-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              
              
              <!-- END HIDDEN FILTER--><!-- START HIDDEN FORM-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              
              
              <!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM
              <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/>-->
              
              <div class="box-content">
                <div class="tool-bar">
                  <ul id="dashboard-buttons">
                    <div class="right">
                      <xsl:for-each select="rows/content/form/tools-bar/item[@type='specific']">
                        <xsl:choose>
                          <xsl:when test="target='_close' or target='_back'">
                            <li> <a class="tooltip-addhoc {target}" href="#">
                              <xsl:if test="img">
                                <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/{img}" />
                              </xsl:if>
                              <br />
                              <xsl:value-of select="title" /> </a> </li>
                          </xsl:when>
                          <xsl:when test="target='_link'">
                            <li> <a class="tooltip-addhoc {target} _blank" href="{parameter}">
                              <xsl:if test="img">
                                <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/{img}" />
                              </xsl:if>
                              <br />
                              <xsl:value-of select="title" /> </a> </li>
                          </xsl:when>
                          <xsl:when test="target='submit'">
                            <li> 
                              <!--<span>Teste</span>-->
                              <button id="buttonSave" class="tooltip-addhoc">
                              <xsl:apply-templates mode="toolsbar-nav" select="." />
                              
                              </button>
                            </li>
                          </xsl:when>
                          <xsl:when test="target='alert_submit'">
                            <li> <a class="tooltip-addhoc" id="buttonLoad"> <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/tb_refresh.png" /> <br />
                              Recarregar </a> </li>
                          </xsl:when>
                          <xsl:otherwise>
                            <li> <a class="tooltip-addhoc {target}">
                              <xsl:apply-templates mode="toolsbar-nav" select="." />
                              
                              </a> </li>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </div>
                  </ul>
                  <div id="loading_submit" ><img src="{$path_tmpl}/img/icon/ajax-loader.gif"/></div>
                </div>
              </div>
              
              
              <!--END TOOL BAR FORM-->
              <div class="box-content">
                <div class="box-head" style="display:none;">
                  <div class="head-left-subtitle"></div>
                  <div class="head-center-subtitle">
                    <h1 id="currentFile">Name Diagram</h1>
                  </div>
                  <div class="head-right-subtitle"></div>
                </div>
                <div> 
                  
                  <!-- Styling for this portion is in BPMN.css -->
                  <div id="PaletteAndDiagram">
                    <div id="sideBar">
                      <div class="handle" style="display:none">Palette:</div>
                      <div id="myPalette" ></div>
                      <div class="handle" style="display:none">Overview:</div>
                      <div id="myOverview" style="display:none"></div>
                    </div>
                    <div id="myDiagram"></div>
                  </div>
                  <div id="openDocument" class="draggable" style="display:none">
                    <div id="openDraggableHandle" class="handle">Open File</div>
                    <div id="openText" class="elementText">Choose file to open...</div>
                    <select id="mySavedFiles" class="mySavedFiles">
                    </select>
                    <br />
                    <button id="openBtn" class="elementBtn" type="button" onclick="loadFile()" style="margin-left: 70px">Open</button>
                    <button id="cancelBtn" class="elementBtn" type="button" onclick="closeElement('openDocument')">Cancel</button>
                  </div>
                  <div id="removeDocument" class="draggable" style="display:none">
                    <div id="removeDraggableHandle" class="handle">Delete File</div>
                    <div id="removeText" class="elementText">Choose file to remove...</div>
                    <select id="mySavedFiles2" class="mySavedFiles">
                    </select>
                    <br />
                    <button id="removeBtn" class="elementBtn" type="button" onclick="removeFile()" style="margin-left: 70px">Remove</button>
                    <button id="cancelBtn2" class="elementBtn" type="button" onclick="closeElement('removeDocument')">Cancel</button>
                  </div>
                  
                  <!-- A simple preset model and JSON save/load buttons are hidden on the page -->
                  <div style="display:none;">
                    <div class="handle">JSON:</div>
                    <div id="buttons">
                      <button id="loadModel" onclick="loadModel()">Load</button>
                      <button id="saveModel" onclick="saveModel()">Save</button>
                    </div>
                    <textarea id="mySavedModel" style="width: 100%; height: 300px;">
        { "class": "go.GraphLinksModel",
          "linkFromPortIdProperty": "fromPort",
          "linkToPortIdProperty": "toPort",
          "modelData": {"position":"230 200"},
          "nodeDataArray": [<xsl:for-each select="rows/content/form/table/activity/value/row[not(@total='yes')]">
          						<xsl:choose>
                                	<xsl:when test="position() != last()">{
                                        "category":"<xsl:value-of select="category"/>",
                                        "item":"<xsl:value-of select="item"/>",
                                        "key":<xsl:value-of select="key"/>,
                                        "loc":"<xsl:value-of select="loc"/>",
                                        "text":"<xsl:value-of select="text"/>"
                                        <xsl:if test="eventtype and eventtype != ''">,
                                        "eventType":<xsl:value-of select="eventtype"/></xsl:if>
                                        <xsl:if test="eventdimension and eventdimension != ''">,
                                        "eventDimension":<xsl:value-of select="eventdimension"/></xsl:if>
                                        <xsl:if test="tasktype and tasktype != ''">,
                                        "taskType":<xsl:value-of select="tasktype"/></xsl:if>
                                        <xsl:if test="gatewaytype and gatewaytype != ''">,
                                        "gatewayType":<xsl:value-of select="gatewaytype"/></xsl:if>
                                        <xsl:if test="category and category != '' and  category = 'activity'">,
                                        "boundaryEventArray":[<xsl:if test="bound/item and bound/item != ''">
                                        						<xsl:for-each select="bound/item">
                                        						<xsl:choose>
                                                                	<xsl:when test="position() != last()">{
                                                                    	<xsl:if test="portid and portid != ''">
                                                                        	"portId":"<xsl:value-of select="portid"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="eventtype and eventtype != ''">,
                                                                        	"eventType":<xsl:value-of select="eventtype"/>
                                                                        </xsl:if>
                                                                         <xsl:if test="color and color != ''">,
                                                                        	"color":"<xsl:value-of select="color"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="alignmentindex and alignmentindex != ''">,
                                                                        	"alignmentIndex":<xsl:value-of select="alignmentindex"/>
                                                                        </xsl:if>
                                                                    },</xsl:when>
                                                                    <xsl:otherwise>{
                                                                    	<xsl:if test="portid and portid != ''">
                                                                        	"portId":"<xsl:value-of select="portid"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="eventiype and eventiype != ''">,
                                                                        	"eventType":<xsl:value-of select="eventiype"/>
                                                                        </xsl:if>
                                                                         <xsl:if test="color and color != ''">,
                                                                        	"color":"<xsl:value-of select="color"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="alignmentindex and alignmentindex != ''">,
                                                                        	"alignmentIndex":<xsl:value-of select="alignmentindex"/>
                                                                        </xsl:if>
                                                                    }</xsl:otherwise>
                                                                 </xsl:choose>
                                                              </xsl:for-each></xsl:if>]
                                        </xsl:if>},
                                    </xsl:when>
                                    <xsl:otherwise>{
                                    	"category":"<xsl:value-of select="category"/>",
                                        "item":"<xsl:value-of select="item"/>",
                                        "key":<xsl:value-of select="key"/>,
                                        "loc":"<xsl:value-of select="loc"/>",
                                        "text":"<xsl:value-of select="text"/>"
                                        <xsl:if test="eventtype and eventtype != ''">,
                                        "eventType":<xsl:value-of select="eventtype"/></xsl:if>
                                        <xsl:if test="eventdimension and eventdimension != ''">,
                                        "eventDimension":<xsl:value-of select="eventdimension"/></xsl:if>
                                        <xsl:if test="tasktype and tasktype != ''">,
                                        "taskType":<xsl:value-of select="tasktype"/></xsl:if>
                                        <xsl:if test="gatewaytype and gatewaytype != ''">,
                                        "gatewayType":<xsl:value-of select="gatewaytype"/></xsl:if>
                                        <xsl:if test="category and category != '' and  category = 'activity'">,
                                        "boundaryEventArray":[<xsl:if test="bound/item and bound/item != ''">
                                        						<xsl:for-each select="bound/item">
                                        						<xsl:choose>
                                                                	<xsl:when test="position() != last()">{
                                                                    	<xsl:if test="portid and portid != ''">
                                                                        	"portId":"<xsl:value-of select="portid"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="eventtype and eventtype != ''">,
                                                                        	"eventType":<xsl:value-of select="eventtype"/>
                                                                        </xsl:if>
                                                                         <xsl:if test="color and color != ''">,
                                                                        	"color":"<xsl:value-of select="color"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="alignmentindex and alignmentindex != ''">,
                                                                        	"alignmentIndex":<xsl:value-of select="alignmentindex"/>
                                                                        </xsl:if>
                                                                    },</xsl:when>
                                                                    <xsl:otherwise>{
                                                                    	<xsl:if test="portid and portid != ''">
                                                                        	"portId":"<xsl:value-of select="portid"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="eventiype and eventiype != ''">,
                                                                        	"eventType":<xsl:value-of select="eventiype"/>
                                                                        </xsl:if>
                                                                         <xsl:if test="color and color != ''">,
                                                                        	"color":"<xsl:value-of select="color"/>"
                                                                        </xsl:if>
                                                                        <xsl:if test="alignmentindex and alignmentindex != ''">,
                                                                        	"alignmentIndex":<xsl:value-of select="alignmentindex"/>
                                                                        </xsl:if>
                                                                    }</xsl:otherwise>
                                                                 </xsl:choose>
                                                              </xsl:for-each></xsl:if>]
                                        </xsl:if>}
                                    </xsl:otherwise>
                                </xsl:choose>
          					</xsl:for-each>],
          "linkDataArray": [<xsl:for-each select="rows/content/form/table/transition/value/row[not(@total='yes')]">
                                <xsl:choose>
                                    <xsl:when test="position() != last()">{
                                    	"from":<xsl:value-of select="from"/>,
                                        "to":<xsl:value-of select="to"/>
                                         <xsl:if test="fromport and fromport != ''">,
                                        "fromPort":"<xsl:value-of select="fromport"/>"</xsl:if>
                                         <xsl:if test="toport and toport != ''">,
                                        "toPort":"<xsl:value-of select="toport"/>"</xsl:if>
                                        <xsl:if test="visible and visible != ''">,
                                        "visible":<xsl:value-of select="visible"/></xsl:if>
                                        <xsl:if test="text and text != ''">, 
                                        "text":"<xsl:value-of select="text"/>"</xsl:if>
                                        <xsl:if test="isdefault and isdefault != ''">, 
                                        "isDefault":<xsl:value-of select="isdefault"/></xsl:if>
                                        <xsl:if test="points and points != ''">,"points":[<xsl:value-of select="points"/>]</xsl:if>},
                                    </xsl:when>
                                    <xsl:otherwise>{
                                       "from":<xsl:value-of select="from"/>,
                                        "to":<xsl:value-of select="to"/>
                                         <xsl:if test="fromport and fromport != ''">,
                                        "fromPort":"<xsl:value-of select="fromport"/>"</xsl:if>
                                         <xsl:if test="toport and toport != ''">,
                                        "toPort":"<xsl:value-of select="toport"/>"</xsl:if>
                                        <xsl:if test="visible and visible != ''">,
                                        "visible":<xsl:value-of select="visible"/></xsl:if>
                                        <xsl:if test="text and text != ''">, 
                                        "text":"<xsl:value-of select="text"/>"</xsl:if>
                                        <xsl:if test="isdefault and isdefault != ''">, 
                                        "isDefault":<xsl:value-of select="isdefault"/></xsl:if>
                                        <xsl:if test="points and points != ''">,"points":[<xsl:value-of select="points"/>]</xsl:if>}
                                    </xsl:otherwise>
                                </xsl:choose>
                             </xsl:for-each>]}
      </textarea>
                  </div>
                </div>
              </div>
              <!-- END FORM-->
            </form>
            <!-- END YOUR CODE HERE --></div>
        </div>
        <!-- START HOME BOTTOM -->
        <xsl:call-template name="home-side"/>
        
      </div>
    </div>
    <!--HOME-FOOTER-->
    </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140422"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140422"/>
</xsl:stylesheet>
