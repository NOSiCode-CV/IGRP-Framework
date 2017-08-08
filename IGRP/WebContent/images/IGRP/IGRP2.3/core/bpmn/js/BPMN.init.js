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

var getKey = function(p){
  var key = 0,
    c = p.category ? p.category.toLowerCase() : 'line';
  switch(c){
    case 'gateway':
      if (p.gatewayType == 1)
        key = 201;
      else if(p.gatewayType == 2)
        key = 301;
      else if(p.gatewayType == 3)
        key = 603;
      else if(p.gatewayType == 4)
        key = 204;
      else if(p.gatewayType == 5)
        key = 302;
      else if(p.gatewayType == 6)
        key = 606;
      else if(p.gatewayType == 7)
        key = 607;
    break;
    case 'lane' :
      key = p.group;
    break;
    case 'activity':
      if (p.taskType == 0) 
        key = 103;
      if (p.taskType == 1) 
        key = 1;
      else if(p.taskType == 2)
        key = 4;
      else if(p.taskType == 3)
        key = 203;
      else if(p.taskType == 4)
        key = 204;
      else if(p.taskType == 5)
        key = 205;
      else if(p.taskType == 6)
        key = 206;
      else if(p.taskType == 7)
        key = 3;
    break;
    case 'event':
      if (p.eventType == 1){
        key = 101;
        if (p.eventDimension == 8)
          key = 104;
        else if (p.eventDimension == 1 && p.group*1)
          key = -802;
        else if (p.eventDimension == 8 && p.group*1)
          key = -803;
      } 
      else if(p.eventType == 2){
        key = 102;
        if (p.eventDimension == 8)
          key = 107;
        else if(p.eventDimension == 4)
          key = 504;
      }
      else if(p.eventType == 3){
        key = 103;
        if (p.eventDimension == 4)
          key = 507;
      }
      else if(p.eventType == 4){
        key = 405;
        if(p.eventDimension == 7)
          key = 508;
      }
      else if(p.eventType == 5){
        key = 401;
        if(p.eventDimension == 4)
          key = 506;
      }
      else if(p.eventType == 6){
        key = 502;
        if(p.eventDimension == 7)
          key = 503;
      }
      else if(p.eventType == 7){
        key = 404;
      }
      else if(p.eventType == 8)
        key = 108;
      else if(p.eventType == 9)
        key = 109;
      else if(p.eventType == 10){
        key = 402;
        if(p.eventDimension == 8)
          key = 403;
        else if(p.eventDimension == 4)
          key = 509;
        else if(p.eventDimension == 7)
          key = 510;
      }
      else if(p.eventType == 11)
        key = 111;
      else if(p.eventType == 11)
        key = 112;
      else if(p.eventType == 13)
        key = 108;
    break;
    case 'subprocess':
      key = 103; 
      if(isAdHoc)
        key = 101;
      else if(isTransaction)
        key = 102;
      else if(isParallel)
        key = 104;
      else if(isCall)
        key = 105;
    break;
    case 'dataobject':
      key = 301;
    break;
    case 'datastore':
      key = 302;
    break;
    case 'privateprocess':
      key = 401;
    break;
    case 'annotation':
      key = 701;
    break;
    default:
      key = 0;
    break;
  }
  return key;
};

var calCtxMenu = function(p){
  var url = $("input[name='p_link_ctx_menu']").val() || $("input[name='p_env_frm_url']").val(),
    xhttp = new XMLHttpRequest(),
    obj   = p.ctx;

  url = $.IGRP.utils.getUrl(url)+'p_key='+getKey(p.data);
  $('li',obj).remove();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var data = $.parseXML(this.responseText),
        li = '';
      $('li:not(.activity)',obj).remove();
      $.each($(data).find('rows row'),function(i,row){
        var target = $('ctx_nome',row).text() ? $('ctx_nome',row).text() : '_blank';
        li += '<li class="operationTable"><a href="'+$('ctx_link',row).text()+'" target="'+target+'">'
            +$('ctx_nome',row).text()+'</a></li>';
      });

      $(obj).append(li);

      if ($(obj).height() > 5) {
        $(obj).css({
          "left"    : p.point.x,
          "top"     : p.point.y,
          "display" : "block"
        });
      }
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
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
        param = bpmnData.key?"p_key="+getKey(bpmnData.key):"p_from="+bpmnData.from+"&p_to="+bpmnData.to;
        
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
