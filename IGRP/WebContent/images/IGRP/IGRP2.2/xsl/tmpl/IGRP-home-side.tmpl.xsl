<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="home-side">

<!--foother pane-->
<!--<div class="ui-layout-south" style="visibility:visible">
<div style="with:100%;height:100%;overflow:auto">
  <xsl:for-each select="rows/content/messages/message[@type='debug']">
  		<xsl:value-of select="." /><br />
  </xsl:for-each>
 </div>
</div>-->

<style>
    .rodape_fixo{ 
      background-color: #D6D5D3;
      font-size: 10px;
      position: fixed;
      bottom: 8px;
      left: 0;
      right: 0;
      display:none;
    }
    .rodape_fixo_img, .rodape_fixo_name{ float:left;}
    .rodape_fixo_name, .rodape_fixo_right{ margin-top:13px; margin-left:10px;}
    .rodape_fixo_right{ float:right; margin-right:20px;}
    .rodape_fixo_name{ font-weight: bold;}
    .margin-bottom{ 100px; }
    .general{padding-bottom: 53px !important;}
  </style>
  <div class="rodape_fixo">
    <div class="rodape_fixo_left">
      <div class="rodape_fixo_img"><img src="{$path_tmpl}/img/rodape_IGRP.png" /></div>
      <div class="rodape_fixo_name">INTEGRATED GOVERNMENT RESOURCE PLANNING</div>
    </div>
    <div class="rodape_fixo_right">2011 @ NOSI Aplicacoes todos os direitos reservados</div>
    <div class="clear"></div>
  </div>



<div class="dbagTop" id="dbagTop"><img src="{$path_tmpl}/img/toggle-up.png" class="img_dbag" id="dbagUp"/></div>
<div class="dbag" id="dbag">
	<div class="dbagM"><img src="{$path_tmpl}/img/toggle-dn.png" class="img_dbag" id="dbagDn"/></div>
	<div class="center_debag">
		<ul>
 			<xsl:for-each select="rows/content/messages/message[@type='debug']">
  				<li><xsl:value-of select="." /></li>
  			</xsl:for-each>
			<div style="clear:both"></div>
		</ul>
		<div style="clear:both"></div>
  </div>
 <div style="clear:both"></div>
</div>

<!--Right Pane-->
<!--<xsl:if test="not(rows/target) or  rows/target!='_blank'">
    <div class="ui-layout-east" style="height:670px; visibility:hidden">
      <center>
        <h4>LATERAL DIREITO</h4>
      </center>
    </div>
    
    
    <div class="ui-layout-west" style="height:670px;  width:300px; visibility:hidden;" >
      <center>
        <h4>LATERAL ESQUERDO</h4>
      </center>
    </div>
</xsl:if>-->

</xsl:template>
</xsl:stylesheet>