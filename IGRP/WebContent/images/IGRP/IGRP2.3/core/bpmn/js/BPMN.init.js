/*$(function(){
  var vTextLabel = null, vItemId = '', vPageTitle = null, vTitle = null, vSave = null, vApp = null;
  init();
 $(".bClickBpmn").on('click',function(e){
    e.preventDefault();
    var vUrl = $(this).attr('href')?$(this).attr('href'):$(this).attr('fw_href');
    switch($(this).attr('target').toLowerCase()){
      case 'submit':
      case 'alert_submit':
        var vParam = [{name:'p_nodedata',value:saveModel()},{name:"p_linkdata",value:saveModel()}]; 
        IGRP_submitStringAsFile({
          pUrl    : vUrl,
          pMessage: true,
          pLoading: true,
          pParam  : {
            pArrayFiles : vParam,
            pContentType: 'text/json',
            pFormat     : 'json',
            pArrayItem  : [{
              name : 'p_id',
              value: vItemId
            }]
          }
        });
      break;
      case '_link':
        var vOutput = (vTitle != null)?'BPMN-'+vTitle+'.png':'BPMN.png';
        IGRP_downloadImg({pImg:myDiagram.makeImageData({scale: 1}),pOutput:vOutput});
      break;
    }
 });
 

 $("body").on("click","a[type='line']",function(e) {
    e.preventDefault();
    var url = $(this).attr('href')
    if(url){
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
          loadJSON(url);
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

  /*WILLY 18.09.15 - APPS SELECTOR ON TOP
  function repositionAppsSelector(){
    var appsHolder = $('.apps-selector');
    $('.col.tool-bar').prepend(appsHolder);
    appsHolder.addClass('set');
  }
  repositionAppsSelector();
   /*APPS SELECTOR ON TOP
   

});*/

var calCtxMenu = function(p){
  console.log('ok');
    /*$.ajax({
      url  : bpmn.url,
      data : $(this).attr('name')+'='+bpmn.app
    })
    .fail(function(e){
      $.IGRP.notify({
        message : 'Not Found',
        type    : 'danger'
      });
    })
    .done(function(data){
      
    });*/
};


(function($){
  init();//INIT BPMN
  var bpmn  = {};
  bpmn.id   = '';
  bpmn.title= $('#igrp-app-title').text();
  bpmn.app  = $('#form_1_env_fk').val();
  bpmn.form = $.IGRP.utils.getForm();

  bpmn.onSubmit = function(){
    bpmn.data     = saveModel();
    var arrayItem = [];
    console.log(bpmn.data);

    if(bpmn.url.indexOf("?")>-1){
      var param = bpmn.url.substring(bpmn.url.indexOf("?")+1),
          p     = param.split("&");

      for(var i=0; i < p.length; i++){
        var v = p[i].split("=");
        if(v[0].toLowerCase() != "p_env_frm_url"){
          arrayItem.push({name:v[0],value:v[1]});
        }
      }
    }
    arrayItem.push({name:'p_id',value:bpmn.id});
    $.IGRP.utils.submitStringAsFile({
      pUrl    : bpmn.url,
      pParam  : {
        pArrayFiles : [{name:'p_data',value:bpmn.data}],
        pContentType: 'text/json',
        pFormat     : 'json',
        pArrayItem  : arrayItem
      }
    });
  }

  bpmn.appChange = function(){
    $("#form_1_env_fk").on("change",function(){
      bpmn.app = $(this).val(), bpmn.url = $("input[name='p_env_frm_url']").val();
      if (bpmn.app != null) {
        $('.addArea').addClass('active');
        $.ajax({
          url  : bpmn.url,
          data : $(this).attr('name')+'='+bpmn.app
        })
        .fail(function(e){
          $.IGRP.notify({
            message : 'Not Found',
            type    : 'danger'
          });
        })
        .done(function(data){
          $('#tabprocessos').XMLTransform({
            xsl       : path+"/core/bpmn/xsl/bpmn-tree-menu.tmpl.xsl",
            xslParams : {template : 'tree-menu'},
            xml       : $(data).find('rows content gen_table table').getXMLDocument(),
            complete  : function(){
              try{
                myDiagram.commandHandler.selectAll();
                myDiagram.commandHandler.deleteSelection();
              }catch(e){null;}
            }
          });
        });
      }else{
        $('.addArea').removeClass('active');
      }
    });
  }

  bpmn.processClick = function(){
    $("body").on("click",".treeview a[type='line'].treeClick",function(e) {
      e.preventDefault();
      var url = $(this).attr('href')
      if(url){
        $('#igrp-app-title').html(bpmn.title+' [ '+$(this).text()+'  ]');

        bpmn.id = $(this).attr('idObj');
        if(!$(e.target).hasClass("btn")){
          myDiagram.commandHandler.selectAll();
          myDiagram.commandHandler.deleteSelection();
          loadJSON(url);
        }
      }
    });
  };

  bpmn.btnAddEditClick = function(){
    $("body").on("click",".treeview .btn, .addArea",function(e){
      e.preventDefault();
      var url       = '',
        parent      = $(this).parents('a:first'),
        parentNode  = parent.parents('li[type="node"]:first');

      if($(this).hasClass('btn')){
        url = $(this).hasClass('addItem') ? parent.attr('linkAdd') : parent.attr('linkEdit');

        parent.hasClass('active') ? parent.addClass('active') : parent.removeClass('active');
        parentNode.hasClass('active') ? parentNode.addClass('active') : parentNode.removeClass('active');
      }else{
        url = $.IGRP.utils.getUrl($('#p_link_add_area').val())+'p_env_fk='+bpmn.app;
      }

      if(url){
        $.IGRP.components.iframeNav.set({
          url       : url,
          beforeLoad: function(c){
            var modal = $($.IGRP.components.iframeNav.modal);
            $('.iframe-nav-close',modal).click(function(){
              $("#form_1_env_fk").change();
            });
          }
        });
      }
    });
  };

  bpmn.ctxBpmnClick = function(){
    $(".ctxBpmn").on('click','li a',function(e){
      e.preventDefault();
      var $obj    = $(this).parents('ul:first'), 
        url       = $(this).attr('href'),
        bpmnData  = vBpmnObj.part.data, 
        param     = '';

      if ($(this).attr('type')=='default'){
        if($obj.attr('id') == "ctx-bpnm-line"){
          if(url == 'default')
            setSequenceLinkDefaultFlow(vBpmnObj);
          else
           setSequenceLinkConditionalFlow(vBpmnObj);
        }
        else
          addActivityNodeBoundaryEvent(url*1);
      }else{
        param = bpmnData.key?"p_key="+bpmnData.key:"p_from="+bpmnData.from+"&p_to="+bpmnData.to;
        
        if(bpmn.id != '')
          param +="&p_id="+bpmn.id;

        bpmn.app = bpmn.app != null ? bpmn.app : $('#form_1_env_fk').val();
        param += '&p_env_fk='+bpmn.app;

        $.IGRP.components.iframeNav.set({
          url:$.IGRP.utils.getUrl(url)+param
        });
      }
      $obj.removeAttr('style');

      return false;
    });
  };

  bpmn.init = function(){ // call functions
    bpmn.appChange();
    bpmn.processClick();
    bpmn.btnAddEditClick();
    bpmn.ctxBpmnClick();
    $('.cOverviw').on('click',function(){
      $(".overviw").toggleClass('active');
    });
    //$("#form_1_env_fk").change();

    var h = $(window).height();
    $('#tabprocessos').height(h - 245);
    $('#myDiagramDiv').height(h - 150);
  };

  $.IGRP.targets['submit'] = function(p){
    bpmn.url =  p.url;
    bpmn.onSubmit();
    return false;
  }

  $.IGRP.targets['alert_submit'] = function(p){
    bpmn.url =  p.url;
    $.IGRP.components.globalModal.set({
      rel    : 'confirm-target',
      content: $('#confirm-text').text(),
      buttons: [{
        class   :'success',
        icon    :'check',
        text    :'Confirmar',
        onClick :function(e){
          try{ bpmn.onSubmit(); }catch(err){ console.log(err); }
            $.IGRP.components.globalModal.hide();
            return false;
          }
        },
        {
          class :'danger',
          icon  :'times',
          text  :'Cancelar',
          attr  :{ 
            "data-dismiss":"modal" 
          }
        }
      ]
    });
    return false;
  }

  $.IGRP.targets['_link'] = function(p){
    var e       = document.createElement('a');
    e.href      = myDiagram.makeImageData({scale: 1});
    e.download  = bpmn.title != '' ? 'BPMN-'+bpmn.title+'.png':'BPMN.png';
    document.body.appendChild(e);
    e.click();
    document.body.removeChild(e);
    return false;
  }

  bpmn.init();
  console.log(bpmn);
})($);
