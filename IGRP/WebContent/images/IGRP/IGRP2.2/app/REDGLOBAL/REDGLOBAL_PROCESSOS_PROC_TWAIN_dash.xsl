<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <!--XSL Generator (RED/DIM 2015)-->
            <head>
                <!--HOME-HEADER-->
                <xsl:call-template name="home-header"/>
                <script language="javascript">
                  var ServerLink='<xsl:value-of select="rows/content/form/value/serverlink" disable-output-escaping="yes"/>',
                    ViewLink = '<xsl:value-of select="rows/content/form/value/viewlink" disable-output-escaping="yes"/>',
                    DocFile = '<xsl:value-of select="rows/content/form/value/docfile" />',
                    DocFileId = '<xsl:value-of select="rows/content/form/value/docfileid" />';
                </script>
                <script type="text/javascript" src="{$path}/js/IGRP.scanner.twain.js?v=1"></script>
                <script language="javascript">
                  var TwainSource;

                  function init(){
             
                    var oCX = document.getElementById("csxi");
                    oCX.style.height = (screen.availHeight-175)+"px";
             
                    var oCXF = document.getElementById("csxif");
                    oCXF.style.height = (screen.availHeight-175)+"px";
             
                    NosiTwain.setOCX(oCX,oCXF);
                    NosiTwain.setServer(ServerLink);
                    NosiTwain.setName(DocFile);
             
                    makeSelect();
                  } 
             
             
                  function OpenClick(){
                     if(NosiTwain.Open()){} 

                     if(NosiTwain.isImage()){}
                  }
             
                  function ScanClick(){
                     NosiTwain.setCurrentDevice(TwainSource.value);
                     if(TwainSource.value==-1)
                     {
                       alert("Scanner não pode ser nulo. Favor Verficar");
                       return;
                     }

                     if(NosiTwain.SelectScan()){}
                     if(NosiTwain.Scan()){}
                  }
             
                  function UploadClick(pObj,pDescricao,pId){
                    setParameter();
                    NosiTwain.setValue(pId);
                    NosiTwain.addParameter(DocFileId,pId);
             
                     if(NosiTwain.Upload()){
                      pObj.parentNode.parentNode.childNodes[1].className = "td_descricao";
                      alert(pDescricao.toUpperCase()+" enviado com sucesso!");
                      try{
                        window.opener.DGTR_doc(pId);
                      }
                      catch(e){null;}
                    }
                    else
                      alert("Falha no envio de documento"+pDescricao.toUpperCase());
                  }
             
                  function SelectClick(){
                    document.formular_default.btn_crop.disabled = false;
                    NosiTwain.SelectArea();
                  }
             
                  function CropClick(){
                    if(NosiTwain.Crop())
                      document.formular_default.btn_crop.disabled = true;
                  }
             
                  function LeftClick(){
                    NosiTwain.RotateLeft();
                  }
             
             
                  function RightClick(){
                    NosiTwain.RotateRight();
                  }
             
                  function ResizeClick(){
                    NosiTwain.Resize(document.formular_default.p_width.value);
                  }
             
                  function showFile(pId,pContentFk){
                    NosiTwain.setLog(pId,ViewLink+pContentFk);
                    NosiTwain.setValue(pId);
                    NosiTwain.showLog();
                  }
                </script>
                <script language="Javascript" for="csxi" event="onacquire()">
                  NosiTwain.PDF();
                </script>
                <script language="javascript">
                  $(function() { 
                    init(); 
                    $(".dgClick").removeAttr('href');
                    $(".dgClick").on('click',function(e){
                      e.preventdefault;
                      if($(this).attr('target') == '_link')
                        OpenClick();
                      else 
                        ScanClick();

                      return false;
                    });
                  });
                </script>
            </head>
            <body class="bodyColor">
                <div class="IGRP_overlay"/>
                <!--HOME TOP-->
                <xsl:call-template name="home-top-main"/>
                <!--HOME-->
                <div id="igrp-bodyPage">
                    <!--HOME LEFT-->
                    <xsl:call-template name="home-slide-menu"/>
                    <!--HOME RIGTH-->
                    <div class="bodyPageRigth">
                        <!--START YOUR CODE HERE-->
                        <!--SHOW TABLET AND MOBILE TITLE-->
                        <div class="box-head showTabMobile">
                            <xsl:value-of select="rows/content/title"/>
                        </div>
                        <!--SHOW NOTIFICATION MESSAGES-->
                        <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
                        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
                            <!--SHOW HIDDEN-->
                            <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                            <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                            <!--START FORM-->
                            <div class="colLR divLeft">
                              <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar">
                                <xsl:with-param name="vClassClick" select="'dgClick'"/>
                              </xsl:apply-templates>
                              <div class="box-content resetPadding">
                                <xsl:if test="rows/content/form/label/scanner">
                                      <div class="col item" item-name="scanner">
                                          <div class="igrp_item select">
                                              <select name="p_device"  id="p_device" class="select"></select>
                                              <div class="_clear"/>
                                          </div>
                                          <div class="_clear"/>
                                      </div>
                                </xsl:if>
                                <div class="_clear"/>
                              </div>
                              <div class="col">
                                <div class="box-collapser addPaddingBottom10">
                                    <div class="box-table table-responsive">
                                        <div class="table-container">
                                            <table class="IGRP_table default-table" data-control="table">
                                                <thead>
                                                    <tr>
                                                        <xsl:if test="rows/content/table/label/descricao">
                                                            <th align="">
                                                                <xsl:value-of select="rows/content/table/label/descricao"/>
                                                            </th>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/table/label/id">
                                                          <th align=""></th>
                                                        </xsl:if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                                                        <tr row="{position()}" class="">
                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                            <xsl:if test="descricao">
                                                                <td align="" data-row="{position()}" data-title="{../../label/descricao}" class="text">
                                                                  <a href="javascript: showFile('{id}','{content_fk}');"><xsl:value-of select="descricao" /></a>
                                                                </td>
                                                            </xsl:if>
                                                            <xsl:if test="id">
                                                                <td align="center" data-row="{position()}" data-title="{../../label/id}" class="text">
                                                                    <img style="cursor:pointer;" src="{$path_tmpl}/img/icon/tools-bar/send.png"  onClick="javascript: UploadClick(this,'{descricao}','{id}');"/>
                                                                </td>
                                                            </xsl:if>
                                                        </tr>
                                                    </xsl:for-each>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="_clear"/>
                                </div>
                              </div>
                            </div>
                            <div class="colCenter">
                              <object classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                              <param name="LPKPath" value="csximagetrial.lpk" />
                              </object>
                              <object id="csxi" classid="CLSID:D7EC6EC3-1CDF-11D7-8344-00C1261173F0" codebase="csximagetrial.ocx" width="600" height="500">
                              </object>
                              <iframe name="csxif" id="csxif" style="display:none;" width="600" height="500"></iframe>
                              <div class="_clear"/>
                            </div>
                            <!--END TABELA--></form>
                        <!--END YOUR CODE HERE-->
                        <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                </div>
                <!--FOOTER PAGE-->
                <div id="igrp-footerPage">
                    <xsl:call-template name="footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20160222"/>
    <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20160222"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20160222"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20160222"/>
</xsl:stylesheet>
