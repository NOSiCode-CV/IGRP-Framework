<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_OUT2_FORM_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
  <script>
  function insertAtCaret(area, text) {
    var scrollPos = area.scrollTop;
    var strPos = 0;
    var br = ((area.selectionStart || area.selectionStart == '0') ? "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") {
        area.focus();
        var range = document.selection.createRange();alert(area);
        range.moveStart ('character', -(area.value.length));
        strPos = range.text.length;
    } else if (br == "ff")
        strPos = area.selectionStart;
    var front = (area.value).substring(0, strPos);  
    var back = (area.value).substring(strPos, area.value.length); 
    area.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") { 
        area.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -(area.value.length));
        range.moveStart ('character', strPos);
        range.moveEnd ('character', 0);
        range.select();
    } else if (br == "ff") {
        area.selectionStart = strPos;
        area.selectionEnd = strPos;
        area.focus();
    }
    area.scrollTop = scrollPos;
}

$(document).ready(function() {
    var options = {
        accept: "div.placeholder",       
        drop: function(ev, ui) {
            insertAtCaret($("textarea.main_text").get(0), ui.draggable.eq(0).text());
        }
    };

    $("div.placeholder").draggable({
        helper:'clone',
        start: function(event, ui) {
            var txta = $("textarea.main_text");
            $("div#pseudodroppable").css({
                position:"absolute",
                top:txta.position().top,
                left:txta.position().left,
                width:txta.width(),
                height:txta.height()
            }).droppable(options).show();
        },
        stop: function(event, ui) {
            $("div#pseudodroppable").droppable('destroy').hide();
        }
    });
});
			</script>
  
    <xsl:call-template name="home-top-inc"/>
    
    <!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA OUT2_FORM OUTPUT FORM -->
    <!-- START YOUR CODE HERE -->
    <!--PAGE TITLE-->
    <div class="box-content">
      <xsl:call-template name="page-title">
        <xsl:with-param name="title" select="rows/content/title" />
        
      </xsl:call-template>
      <!--NOTIFICATION MESSAGES-->
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
        <xsl:with-param name="class" select="'notification'"/>
        
      </xsl:apply-templates>
      <!-- LEFT COLUMN -->
      <div class="left-1">
        <xsl:apply-templates mode="lateral-menu" select="rows/content/menu">
        	<xsl:with-param name="placeholder" select="'placeholder'"/>
        </xsl:apply-templates>
      </div>
      <!-- CENTER COLUMN -->
      <div class="center-1">
        <!--START PAGE-->
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data">
          <!--FORMULARIO -->
          <!--START FORM-->
          <!--TOOL BAR-->
          <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
          
          <div class="box-content">
            <!--HIDDEN FIELDS-->
            <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
            
            <label> <span>(*) <xsl:value-of select="rows/content/form/label/doc_tp_fk"/></span>
              <select name="{rows/content/form/list/doc_tp_fk/@name}" class="required">
                <xsl:for-each select="rows/content/form/list/doc_tp_fk/option">
                  <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/> </option>
                </xsl:for-each>
              </select>
            </label>
            <label> <span>(*) <xsl:value-of select="rows/content/form/label/send_type"/></span>
              <select name="{rows/content/form/list/send_type/@name}" class="required">
                <xsl:for-each select="rows/content/form/list/send_type/option">
                  <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/> </option>
                </xsl:for-each>
              </select>
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/proc_name"/></span>
              <input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}"  class="" maxlength="200" />
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/gener_flag"/></span>
              <input type="checkbox" name="{rows/content/form/value/gener_flag/@name}" value="1"  class="">
              <xsl:if test="rows/content/form/value/gener_flag='1'">
                <xsl:attribute name="checked">checked</xsl:attribute>
              </xsl:if>
              </input>
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/status"/></span>
              <input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class="">
              <xsl:if test="rows/content/form/value/status='1'">
                <xsl:attribute name="checked">checked</xsl:attribute>
              </xsl:if>
              </input>
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/tipo"/></span>
              <input type="text" name="{rows/content/form/value/tipo/@name}" value="{rows/content/form/value/tipo}"  disabled="disabled"  class="" maxlength="30" />
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/content"/></span>
            
            <!--TEXT EDITOR TEMPLATE-->
              <xsl:call-template name="text-editor">
                <xsl:with-param name="name" select="rows/content/form/value/content/@name" />
                <xsl:with-param name="value" select="rows/content/form/value/content"/>
                <xsl:with-param name="pseudodroppable" select="'pseudodroppable'"/>
                <xsl:with-param name="main_text" select="'main_text'"/>
              </xsl:call-template>
              <!-- END TEXT EDITOR TEMPLATE-->
              
            </label>
          </div>
          <!--END FORM-->
          <!--TOOL BAR-->
          <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />
          
          <!-- CONTEXT-MENU -->
          <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
          
          <!--INICIO DA TABELA-->
          <div class="table">
            <table class="sortable">
              <!--CABECALHO DA TABELA-->
              <thead>
                <tr> </tr>
              </thead>
              <!--CORPO DA TABELA-->
              <tbody>
                <xsl:for-each select="rows/content/table/value/row">
                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                  <tr class="IGRP_contextMenu">
                    <xsl:apply-templates mode="context-param" select="context-menu" />
                    
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <!--FIM DA TABELA-->
        </form>
        <!--END PAGE-->
      </div>
    </div>
    <!-- END YOUR CODE HERE -->
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
  <xsl:include href="../../xsl/tmpl/IGRP-lateral-menu.tmpl.xsl?v=1"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=1"/>
</xsl:stylesheet>