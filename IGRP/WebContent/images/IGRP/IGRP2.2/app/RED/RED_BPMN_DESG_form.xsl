<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED / DIM )--><!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    <link href="{$path}/extentions/bpmn/css/goSamplesbpmn.css" rel="stylesheet" type="text/css"/>
    <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
    <script type="text/javascript" src="{$path}/extentions/bpmn/js/release/go.js"></script>
    <script type="text/javascript" src="{$path}/extentions/bpmn/js/goSamplesbpmn.js"></script>
    <script type="text/javascript" src="{$path}/extentions/bpmn/js/bpmn.js"></script>
    <script type="text/javascript" id="code">
			var data=null;
		  $(document).ready(function(e) {
			  var param = null, url = window.location;
				window.onload(init("myDiagram")); 
				$("#buttonSave").click(function(){save();
					/*param = $("#formular_default").serialize();
					url = url+"&amp;"+param;
					//console.log(url);*/
					IGRP_submit($(this).attr("href"));
					//$("#formular_default").attr("action",url).submit();
				
				});
				$("#buttonLoad").click(function(){load();});
		  });
 		</script>
    <body>
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
              <li> 
                  <a class="tooltip-addhoc {target}" href="#">                   
                        <xsl:if test="img">
                        	<img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/{img}" /> 
                        </xsl:if>
                        <br />
                        <xsl:value-of select="title" />
                  </a>
                 
              </li>
             </xsl:when>
             
             <xsl:when test="target='_link'">
              <li> 
                  <a class="tooltip-addhoc {target} _blank" href="{parameter}">                   
                        <xsl:if test="img">
                        	<img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/{img}" /> 
                        </xsl:if>
                        <br />
                        <xsl:value-of select="title" />
                  </a>
                 
              </li>
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
              	<li> 
                  <a class="tooltip-addhoc {target}">                   
                    <xsl:apply-templates mode="toolsbar-nav" select="." />
                  </a> 
              </li>
              </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </div>
        </ul>
        <div id="loading_submit" ><img src="{$path_tmpl}/img/icon/ajax-loader.gif"/></div>
      </div>
      
    </div>
              
              <!--<div class="box-content">
                <div class="tool-bar">
                  <ul id="dashboard-buttons">
                    <div class="right">
                      <li> <a class="tooltip-addhoc" id="buttonSave"> <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/save.png" /> <br />
                        Gravar </a> </li>
                      <li> <a class="tooltip-addhoc" id="buttonLoad"> <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/tb_refresh.png" /> <br />
                        Recarregar </a> </li>
                        <li> <a class="tooltip-addhoc _close"> <img alt="{title}" name="{title}" border="0" src="{$path_tmpl}/img/icon/tools-bar/close.png" /> <br />
                        Fechar </a> </li>
                    </div>
                  </ul>
                </div>
              </div>-->
              <!--END TOOL BAR FORM-->
              <div class="box-content">
                <textarea id="mySavedModel" style=" display:none;">
            {"class": "go.GraphLinksModel",
            "linkFromPortIdProperty": "fromPort",
            "linkToPortIdProperty": "toPort",
            "nodeDataArray":[<xsl:for-each select="Activities/Activity">
                                <xsl:choose>
                                    <xsl:when test="position() != last()">{
                                        <xsl:if test="category and category != ''">
                                        "category":"<xsl:value-of select="category"/>",</xsl:if> 
                                        <xsl:if test="text and text != ''">
                                        "text":"<xsl:value-of select="text"/>",</xsl:if>
                                        <xsl:if test="figure and figure != ''">
                                        "figure":"<xsl:value-of select="figure"/>",</xsl:if>
                                        <xsl:if test="key and key != ''">
                                        "key":<xsl:value-of select="key"/>,</xsl:if>
                                        <xsl:if test="loc and loc != ''">
                                        "loc":"<xsl:value-of select="loc"/></xsl:if>"},
                                    </xsl:when>
                                    <xsl:otherwise>{
                                        <xsl:if test="category and category != ''">
                                        "category":"<xsl:value-of select="category"/>",</xsl:if>
                                        <xsl:if test="text and text != ''">
                                        "text":"<xsl:value-of select="text"/>",</xsl:if>
                                        <xsl:if test="figure and figure != ''">
                                        "figure":"<xsl:value-of select="figure"/>",</xsl:if>
                                        <xsl:if test="key and key != ''">
                                        "key":<xsl:value-of select="key"/>,</xsl:if>
                                        <xsl:if test="loc and loc != ''">
                                        "loc":"<xsl:value-of select="loc"/></xsl:if>"}
                                    </xsl:otherwise>
                               </xsl:choose>
                            </xsl:for-each>],
            
            "linkDataArray":[<xsl:for-each select="Transitions/Transition">
                                <xsl:choose>
                                    <xsl:when test="position() != last()">{
                                    	"from":<xsl:value-of select="from"/>, 
                                        "to":<xsl:value-of select="to"/>, 
                                        "fromPort":"<xsl:value-of select="fromPort"/>", 
                                        "toPort":"<xsl:value-of select="toPort"/>"<xsl:if test="visible and visible != ''">,
                                        "visible":<xsl:value-of select="visible"/></xsl:if><xsl:if test="text and text != ''">, 
                                        "text":"<xsl:value-of select="text"/>"</xsl:if>},
                                    </xsl:when>
                                    <xsl:otherwise>{
                                        "from":<xsl:value-of select="from"/>, 
                                        "to":<xsl:value-of select="to"/>, 
                                        "fromPort":"<xsl:value-of select="fromPort"/>", 
                                        "toPort":"<xsl:value-of select="toPort"/>"<xsl:if test="visible and visible != ''">,
                                        "visible":<xsl:value-of select="visible"/></xsl:if><xsl:if test="text and text != ''">, 
                                        "text":"<xsl:value-of select="text"/>"</xsl:if>}
                                    </xsl:otherwise>
                                </xsl:choose>
                             </xsl:for-each>]}
       </textarea>
                <div class="bpmngeral"> <span class="bpmnleft">
                  <div id="myPalette"></div>
                  </span> <span class="bpmnright">
                  <div id="myDiagram"></div>
                  </span> </div>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140414"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140414"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140414"/>
</xsl:stylesheet>
