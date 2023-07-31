<?xml version="1.0" encoding="utf-8"?>
<!--DWXMLSource="../xml/IGRP-login.xml"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" />

  <xsl:variable name="path_tmpl" select="concat($path,'/core/login/')"/>

	<xsl:template match="/">
		<!--INCIO HEADER-->
		<html>
			<head>
				<TITLE>IGRP - Login</TITLE>
				<link REL="SHORTCUT ICON" HREF="{$path_tmpl}/img/icon/favicon.ico" />
				<meta http-equiv="X-UA-Compatible" content="IE=9" />
				<link media="screen,print,projection" type="text/css" href="{$path_tmpl}/css/login.css" rel="stylesheet"/>
				<link rel='stylesheet' href='{$path_tmpl}/css/login_v2.css' />
				<link rel='stylesheet' media='screen and (max-width: 1000px)' href='{$path_tmpl}/css/login_tablet.css' />
				<link rel='stylesheet' media='screen and (max-width: 540px)' href='{$path_tmpl}/css/login_sphone.css' />

			</head>
			<body>
				<div class="Absolute-Center is-Responsive">
					<!--BANNER LEFT LOGIN-->
						<div onclick="window.open('http://www.nosi.cv/','IGRP Framework');" id="left" class="inner" style="background-image:url({$path_tmpl}/img/banner_IGRP-SPAM.gif?v={$version}); cursor: pointer;"></div>
					<div id="rigth" class="inner">
						<center>
							<img id="bRightImg" src="{$path_tmpl}/img/bgright.png"/>
						</center>
						<div id="rt_content">
							<div class="message-login">
								<xsl:apply-templates mode="notif_messages" select="/rows/content/messages" />
							</div>
							<form action="{/rows/content/action}" method="post" id="formular_log" class="login_formular">
								<div class="login_title"></div>
								<label>
									<div>
										<xsl:value-of select="/rows/content/form/label/user"/>:
									</div>
									<div>
										<input type="text" name="{/rows/content/form/value/user/@name}" value="{/rows/content/form/value/user}" class="login_text-input" />
									</div>
								</label>
								<label>
									<div>
										<xsl:value-of select="/rows/content/form/label/password"/>:
									</div>
									<div>
										<input type="password" name="{/rows/content/form/value/password/@name}" class="login_text-input"  autocomplete="off"/>
									</div>
								</label>
								<div>
									<xsl:if test="//rows/content/form/label/key1">
										<label>
											<xsl:value-of select="/rows/content/form/label/key1"/>º:
											<input type="text" name="{/rows/content/form/value/key_value1/@name}" class="login_text-input2"  autocomplete="off"/>
											<input type="hidden" name="{/rows/content/form/value/key1/@name}" value="{/rows/content/form/value/key1}" class="login_text-input" />
										</label>
									</xsl:if>
									<xsl:if test="//rows/content/form/label/key2">
										<label>
											<xsl:value-of select="/rows/content/form/label/key2"/>º:
											<input type="text" name="{/rows/content/form/value/key_value2/@name}" class="login_text-input2"  autocomplete="off"/>
											<input type="hidden" name="{/rows/content/form/value/key2/@name}" value="{/rows/content/form/value/key2}" class="login_text-input" />
										</label>
									</xsl:if>
								</div>
								
								<div>
									<input type="submit" class="login_submit" value="{/rows/content/form/label/button}" />
									<div class="clear"></div>
								</div>
								<div class="clear"></div>
							</form>
						</div>
						<div class="login_footer">
							<xsl:value-of select="footer_note"/>
						</div>
					</div>
				</div>
        <xsl:call-template name="IGRP-bottom"/>
				<script type="text/javascript">

          var dHeight;
      var wHeight;
      var div = $('.Absolute-Center');
      var imgFix;
      if($('#bRightImg').height() &gt; 0){
      imgFix = 0;
      }else { 
      imgFix = 207;
      }
      function reSize(){
      dHeight = $('.Absolute-Center').height() + imgFix;
      imgFix = 0;
      wHeight = $(window).height();
      var calcMrg = (wHeight - dHeight)/2;
      if(calcMrg &lt; 0){
      calcMrg = 0;	
      }
      div.css('margin-top',calcMrg);
      }
      $(window).resize(reSize)
      reSize();
      $('.IGRP_not_close').unbind('click').click(function(){
      $(this).parent().parent().parent().fadeOut('fast',function(){
      $(this).remove();
      reSize();
      }); 
      });</script>
				<style type="text/css">
          .browser-compatib{
      			width:100%;
      			height:40px;
      			text-align:center;
      			font-size:11px;
      			color:#333;
      		}
    </style>
				<div class="browser-compatib">Optimizado para Internet Explorer 9 ou superior, Mozila Firefox e Safari.</div>
			</body>
		</html>
		<!--FIM FOOTER--></xsl:template>
	<xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>