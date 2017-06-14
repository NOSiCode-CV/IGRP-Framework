$(function(){

  var vTextLabel = null, vItemId = '', vPageTitle = null, vTitle = null, vSave = null, vApp = null;
  init("myDiagram");
 $(".bClickBpmn").on('click',function(e){
    e.preventDefault();
    var vUrl = $(this).attr('href')?$(this).attr('href'):$(this).attr('fw_href');
    switch($(this).attr('target').toLowerCase()){
      case 'submit':
        var vData = saveModel();
        var vParam  = [{name:'p_nodedata',value:vData.nodedata},{name:"p_linkdata",value:vData.linkdata}]; 
        IGRP_submitStringAsFile({pUrl:vUrl,
          pMessage:true,pLoading:true,
          pParam:{pArrayFiles:vParam,
            pArrayItem:[{name:'p_id',value:vItemId}]
          }
        });
      break;
      case '_link':
        var vOutput = (vTitle != null)?'BPMN-'+vTitle+'.png':'BPMN.png';
        IGRP_downloadImg({pImg:myDiagram.makeImageData({scale: 1}),pOutput:vOutput});
      break;
      case 'alert_submit':
         //loadModel();
        var vData = saveModel();
        var vParam  = [{name:'p_nodedata',value:vData.nodedata},{name:"p_linkdata",value:vData.linkdata}]; 
        IGRP_submitStringAsFile({pUrl:vUrl,
          pMessage:true,pLoading:true,
          pParam:{pArrayFiles:vParam,
            pArrayItem:[{name:'p_id',value:vItemId}]
          }
        });
      break;
    }
 });
 

 $("body").on("click","a[type='line']",function(e) {
    e.preventDefault();
    if($(this).attr('href')){
      vTitle = ' [ '+$(this).text()+'  ]';
      if($("#igrp-topPage")[0]){
        vPageTitle = (vPageTitle != null)?vPageTitle:$(".pageTitle").text();
        $(".pageTitle").text(vPageTitle+vTitle);vTitle
        $(".showTabMobile").text(vPageTitle+vTitle);
      }else{
        vPageTitle = (vPageTitle != null)?vPageTitle:$(".showTabMobile").text();
        $(".showTabMobile").text(vPageTitle+vTitle);
      }
      vItemId = $(this).attr('idObj');
      if(!$(e.target).hasClass("btn")){
        myDiagram.commandHandler.selectAll();
        myDiagram.commandHandler.deleteSelection();
        $("#PaletteAndDiagram .bpmn_loading").toggleClass('active');
        
        $("#dataJSON").XMLTransform({
          xsl:path+"/extensions/bpmn/xsl/IGRP-bpmnData.tmpl.xsl",
          xml:$(this).attr('href'),
          complete:function(){
            try{
              loadModel();
            }catch(e){null;}
            $("#PaletteAndDiagram .bpmn_loading").toggleClass('active');
          },
          loading:false
        });
      }
    }
 });

  var HideIframe = function(){
    IGRP_blackBody({pType:false});
    $('#iframe-dialog').removeClass('active');
  };

 $("body").on("click",".listTree a .btn, .addArea", function(e){
    var vThisUrl = '', vThisParent = $(this).parents("a:first");

    if($(this).hasClass('btn')){
      vThisUrl    = $(this).hasClass('addItem')?vThisParent.attr('linkAdd'):vThisParent.attr('linkEdit');
    }else{
      vThisUrl = IGRP_getUrl($('#p_link_add_area').val())+'p_env_fk='+vApp;
    }
    
    if (vThisUrl != null && vThisUrl != ''){
      setIframeContentLookup({
        pUrl    :vThisUrl,
        holder  :$('#iframe-dialog'),
        iframe  :$('#iframe-dialog iframe'),
        pBeforeReady:function(contents){
            var vBody = contents.find('body');
            vBody.addClass('iframe-full-sreen');
            contents.find('.bClick[target="_close"]').on('click',HideIframe);
            var vSave = contents.find('.bClick[target="submit"]');
            var vForm = contents.find('#formular_default');

            $(vSave).removeClass('bClick').addClass('bPmnClick');
            $(vSave).on('click',function(e){
              e.preventDefault();
              var vData = vForm.find('*').not(".notForm").serialize();
              var vUrl = $(this).attr("fw_href")?$(this).attr("fw_href"):$(this).attr("href");
              if(IGRP_validate(vForm)){
                vBody.find('.IGRP_overlay').addClass('active');
                vBody.addClass('noscroll loading');
                IGRP_submitAjax({
                  pUrl:vUrl,
                  pData:vData,
                  pMessage:true,
                  pAjaxComplete:function(){
                    HideIframe();
                    $(".bpmnApp").trigger('change');
                    /*vBody.find('.IGRP_overlay').removeClass('active');
                    vBody.removeClass('noscroll loading');*/
                  }
                });
              }else
                IGRP_message({pObjt:vForm,pType:'error',pMessage:JSMSG_ERROR_FILD_REQUIRED,pPos:'before'});
            });
          },
        pCallback   :function(){
          IGRP_blackBody({pType:true});
          $('#iframe-dialog').addClass('active');
        }
      });
    }
    return false;
 });

  $(".bpmnApp").on("change",function(){
    var vVal = $(this).val(), vUrl = $("input[name='p_env_frm_url']").val();
    vApp = vVal;
    if (vVal != null) {
      $('.addArea').addClass('active');
      IGRP_submitAjax({
        pUrl:vUrl,
        pData:$(this).attr('name')+'='+vVal,
        pTransf:true,
        pDiv:$('#listProcess'),
        pMatch:'rows content > table',
        pXsl:path+"/xsl/tmpl/IGRP-tree-menu.tmpl.xsl",
        pXslParam:{template : 'tree-menu'},
        pComplete:function(){
          IGRP_treeMenuActiveAllItem();
          try{
            myDiagram.commandHandler.selectAll();
            myDiagram.commandHandler.deleteSelection();
          }catch(e){null;}
        }
      });
    }else{
      $('.addArea').removeClass('active');
    }
  });

  $(".ctxBpmn").on('click','li a',function(e){
    e.preventDefault();
    //console.log(vBpmnObj);
    var vObj = $(this).parents('ul:first'), vHref = $(this).attr('href'),
        vObjBpmn = vBpmnObj.part.data, vParam = '';
    if ($(this).attr('type')=='default'){
        if(vObj.attr('id') == "ctx-bpnm-line"){
          if(vHref == 'default')
            setSequenceLinkDefaultFlow(vBpmnObj);
          else
           setSequenceLinkConditionalFlow(vBpmnObj);
        }
        else
          addActivityNodeBoundaryEvent(vHref*1);
    }else{
      vParam = vObjBpmn.key?"p_key="+vObjBpmn.key:"p_from="+vObjBpmn.from+"&p_to="+vObjBpmn.to;
      if(vItemId!= '')
        vParam +="&p_id="+vItemId;
      IGRP_h_popupCtx({pUrl:IGRP_getUrl(vHref)+vParam,pWin:'IGRP_bpmn'});
    }
    vObj.removeAttr('style');
  });

  $("body").on('click','.cOverviw', function(){
    $(".overviw").toggleClass('active');
  });

  /*WILLY 18.09.15 - APPS SELECTOR ON TOP*/
  function repositionAppsSelector(){
    var appsHolder = $('.apps-selector');
    $('.col.tool-bar').prepend(appsHolder);
    appsHolder.addClass('set');
  }
  repositionAppsSelector();
   /*APPS SELECTOR ON TOP*/
   

});