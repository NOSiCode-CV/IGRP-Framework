$(function(){
  CKEDITOR.config.protectedSource.push( /(<xsl:[^\>]+>[\s|\S]*?<\/xsl:[^\>]+>)|(<xsl:[^\>]+\/>)/gi );
  CKEDITOR.config.forceEnterMode = true;
  CKEDITOR.config.forcePasteAsPlainText = true;
  CKEDITOR.config.toolbarCanCollapse = true;
  CKEDITOR.config.height = $(window).height() - 205;
  var vData = '', vArrayTable = [], vTableItem = [], vTagItem = [], vItem = [], vIdApp = null,
   vIdDataSorce = null, vIdResports = null, vChart = false, vReportTitle = null,
   vArrayCharts = [], vDoc = null, vPreview = false;

  var sTrXsl = function(value){
    return value.substring(value.indexOf('[')+1,value.lastIndexOf(']')).toLowerCase();
  };

  function webReportValue(){
    vData = CKEDITOR.instances['p_report_editor'].getData();
    var vXslpath = 'rows/content/form/value/';
    var filter = new CKEDITOR.htmlParser.filter({
      text: function(value) {
        return value;
      },
      elements:{
        img:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos,
            no      = element.attributes.no;
          if(attr != undefined){
            element.attributes.src ='{rows/content[position()='+pos+']/'+no+'/value/'+attr+'}';
            delete element.attributes.rel;
            delete element.attributes.pos;
            delete element.attributes.no;
          }
        },
        table:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos;
          if(attr != undefined){
            delete element.attributes.rel;
            delete element.attributes.pos;
            var td = '', th = '',
             vPath = (element.attributes.type == 'separator')?'rows/content[position()='+pos+']/form/table/'+attr:
             'rows/content[position()='+pos+']/'+attr;
             delete element.attributes.type;
            element.forEach( function(node) {
              if (node.name == 'th') {
                var rel = node.attributes.rel;
                th+='<th><xsl:value-of select="'+vPath+'/label/'+rel+'" /></th>';
                td+='<td><xsl:value-of select="'+rel+'"/></td>';
              }
            });
            element.setHtml('<thead><tr>'+th+'</tr></thead>'+
              '<tbody><xsl:for-each select="'+vPath+'/value/row">'+
              '<tr>'+td+'</tr></xsl:for-each></tbody>');
          }
        },
        span:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos,
            no      = element.attributes.no,
            type    = element.attributes.type;
          if(attr){
            if(element.attributes.charttype) {
              element.setHtml('<xsl:call-template name="igrp-graph">'+
              '<xsl:with-param name="table" select="rows/content[position()='+pos+']/'+attr+'"/>'+
              '<xsl:with-param name="chart_type" select="rows/content[position()='+pos+']/'+attr+'/chart_type"/>'+
              '<xsl:with-param name="height" select="rows/content[position()='+pos+']/'+attr+'/height"/>'+
              '<xsl:with-param name="title" select="rows/content[position()='+pos+']/'+attr+'/caption"/>'+
              '</xsl:call-template>');
              delete element.attributes.charttype;
            }else{
              var vPath = '<xsl:value-of select="rows/content[position()='+pos+']/'+no+'/value/'+attr+'/>';
              if (type) {
                vPath = (type == 'link')?'<a href="{rows/content[position()='+pos+']/'+no+'/value/'+attr+'}">'+
                '<xsl:value-of select="rows/content[position()='+pos+']/'+no+'/label/'+attr+'/></a>':
                "rows/content[position()="+pos+"]/"+no+"/list/"+attr+"/option[@selected='true']";
              }
              element.setHtml(vPath);
              delete element.attributes.type;
              delete element.attributes.no;
            }
            delete element.attributes.rel;
            delete element.attributes.pos;
          }
        }/*,
        div:function(element){
          var attr  = element.attributes.rel,
            pos     = element.attributes.pos;
          if(attr && element.attributes.charttype){
            element.setHtml('<xsl:call-template name="igrp-graph">'+
              '<xsl:with-param name="table" select="rows/content[position()='+pos+']/'+attr+'"/>'+
              '<xsl:with-param name="chart_type" select="rows/content[position()='+pos+']/'+attr+'/chart_type"/>'+
              '<xsl:with-param name="height" select="rows/content[position()='+pos+']/'+attr+'/height"/>'+
              '<xsl:with-param name="title" select="rows/content[position()='+pos+']/'+attr+'/caption"/>'+
              '</xsl:call-template>');
            delete element.attributes.rel;
            delete element.attributes.pos;
            delete element.attributes.charttype;
          }
        }*/
      }
    });

    var fragment = CKEDITOR.htmlParser.fragment.fromHtml(vData);
     var writer = new CKEDITOR.htmlParser.basicWriter();
      filter.applyTo( fragment );
      fragment.writeHtml( writer );
      return writer.getHtml();
  }

  function creatTabel(pTable){
    var td = ''; th = '';
    pTable.forEach(function(e,i){
      th+='<th rel="'+vTagItem[i]+'">'+e+'</th>';
      i+=1;
      td+='<td>Text '+i+'</td>';
    });
    return{th:th,td:td};
  }

  function setItemArray(pItem,pRel){
    if($.inArray(pItem,vItem) == -1){
      vItem.push(pItem);
      vTagItem.push(pRel);
      return true;
    }else
      return false;
  }

  function readItemArray(pObj){
    if(pObj.pObj[0]){
      if (pObj.pType == 'node') {
        if ((pObj.pCol*1) > $('thead tr th',pObj.pObj).length) {
          vItem = [];
          vTagItem = [];
        }
      }else{
        if (!$('thead tr th[rel="'+pObj.pRel+'"]',pObj.pObj)[0]) {
          if($.inArray(pObj.pItem,vItem) != -1){
            vItem.splice(vItem.indexOf(pObj.pItem), 1);
            vTagItem.splice(vTagItem.indexOf(pObj.pItem), 1);
          }
        }
      }
    }
  }
  var vArrayItemTable = []
  /*EDSON*/
  function setItemArrayTable(arr){
    var vNotExist = false;
    if (vArrayItemTable.length > 0) {
      vArrayItemTable.forEach(function(e,i){
        if (e.value != arr.value)
          vNotExist = true;
      });

      console.log(vNotExist);
      if (vNotExist)
        vArrayItemTable.push(arr);
    }else
    vArrayItemTable.push(arr);
  }

  function readArrayTable(pRel){
    if (vArrayTable.length > 0) {
      vArrayTable.forEach(function(arr,irr){
        if (arr.name == pRel){
          arr.value.forEach(function(e,i){
            if($.inArray(e,vArrayTable) != -1){
              console.log(e);
              vArrayTable.splice(vArrayTable.indexOf(e), 1);
            }
          });
        }else{
          vArrayTable.push({name:pRel,value:vArrayItemTable});
        }
      });
    }else{
      vArrayTable.push({name:pRel,value:vArrayItemTable});
    }
  }

  function showAddReports(){
    $("input[name='p_title']").removeClass('error');
    IGRP_blackBody({pType:true});
    $("#reportTitle").addClass('active');
  }

  function cancelAddReports(){
    $("#reportTitle").on('click','#btrCancel',function(){
      $("#reportTitle").removeClass('active');
      IGRP_blackBody({pType:false});
    });
  }

  function requiredFild(){
    if (vIdApp == null)
      $('#p_env_fk_chosen a').addClass('error');
    if(vIdDataSorce == null)
      $('#p_datasorce_app_chosen a').addClass('error');

    IGRP_message({pObjt:$('#formular_default'),pType:"error",pMessage:JSMSG_ERROR_FILD_REQUIRED +' ('+app+' & '+dataSource+')',pPos:'before'});
  }

  $('.addReports').on('click',function(){
    if (vIdApp != null && vIdDataSorce != null){
      $('.title','#reportTitle').html('Titulo de Report');
      $('.message','#reportTitle').html('<div class="igrp_item"><input type="text" name="p_title" placeholder="Titulo"/></div>');
      showAddReports();
      $("#reportTitle").unbind("click").on('click','#btrOK',function(){
        var vValReport = $("input[name='p_title']").val();
        if(vValReport!= '' && vValReport!= null){
          vReportTitle = vValReport;
          $("#reportTitle").removeClass('active');
          IGRP_blackBody({pType:false});
          $("input[name='p_title']").val('');
          if(vIdResports != null)
            CKEDITOR.instances['p_report_editor'].setData('');

          vIdResports = null;
        }else
          $("input[name='p_title']").addClass('error');
      });
    }
    else{
      requiredFild();
    }
    cancelAddReports();
  });

  function sendNameReport (pObj) {
    IGRP_submitStringAsFile({
      pUrl:pObj.pUrl,
      pMessage:true,
      pLoading:true,
      pParam:{
        pArrayFiles:pObj.pParam,
        pArrayItem:pObj.pArrayItem
      },
      pComplete:function(){
        $('#p_env_fk').trigger('change');
        $("#reportTitle").removeClass('active');
        $('.itemMenu').removeClass('active');
        $('#tab1').addClass('active');
        $("#listReports ul li a:containsIN('"+vReportTitle+"')").trigger('click');
        IGRP_blackBody({pType:false});
        console.log('B');
          console.log(vPreview);
        /*if(vPreview)
          $('.bWebReport[target="alert_submit"]').trigger('click');*/
      }
    });
  }

  function buttonWebReportClick(){
    $('.bWebReport').unbind("click").on('click',function(e){
      e.preventDefault();
      var vB = $(this),
      vUrl = vB.attr('href')?vB.attr('href'):vB.attr('fw_href');
      switch(vB.attr('target').toLowerCase()){
        case 'submit':
        var vHead = '<link media="all" rel="stylesheet" href="/images/IGRP/extensions/webReport/css/webReportPrint.css"/>',
            vInclud = '',
            header = '<div class="col">Web Report</div>';
        if (vChart) {
          vHead += '<script type="text/javascript" src="/images/IGRP/js/jquery-2.1.1.min.js"></script>'+
            '<script type="text/javascript" src="/images/IGRP/extensions/highcharts/js/highcharts.js"></script>'+
            '<script type="text/javascript" src="/images/IGRP/extensions/highcharts/js/highcharts-more.js"></script>';

          vInclud = '<xsl:include href="/images/IGRP/xsl/tmpl/IGRP-graph.tmpl.xsl?v="'+IGRP_returnTime()+'/>';
        }
        
        var vXslData = '<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">'+
          '<xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>'+
          '<xsl:template match="/"><html><head>'+vHead+'</head>'+
          '<body><div class="wrap">'+
            webReportValue().replace(/&nbsp;/g, " ")+
          '</div></body></html></xsl:template>'+vInclud+
          '</xsl:stylesheet>';
        vData = $.trim(vData.replace(/&nbsp;/g, " ").replace(/"/g, "'").replace(/\s+/g," "));
       /* console.log(vXslData);
        console.log('-------------');
        console.log(vData);*/
        if (vIdApp != null && vIdDataSorce != null){
          var vParam  = [{name:'p_xslreport',value:vXslData},{name:"p_textreport",value:vData}];
          var vArrayItem = '', vAllParam = '';
          if (vIdResports != null) {
            vArrayItem = [{name:'p_env_fk',value:vIdApp},{name:'p_datasorce_app',value:vIdDataSorce},{name:'p_id',value:vIdResports}];
            IGRP_submitStringAsFile({
              pUrl:vUrl,
              pMessage:true,
              pLoading:true,
              pParam:{
                pArrayFiles:vParam,
                pArrayItem:vArrayItem
              },pComplete:function(){
                $('#p_env_fk').trigger('change');
                console.log('A');
                console.log(vPreview);
                /*if(vPreview)
                  $('.bWebReport[target="alert_submit"]').trigger('click');*/
              }
            });
          }else{
            if (vReportTitle == null) {
              showAddReports();
              $("#reportTitle").unbind("click").on('click','#btrOK',function(){
                if(!$("#reportTitle").data('key')){
                    vReportTitle = $("input[name='p_title']").val();
                  if (vReportTitle!= '' && vReportTitle!= null) {
                    $("#reportTitle").removeClass('active');
                    vArrayItem = [{name:'p_env_fk',value:vIdApp},{name:'p_datasorce_app',value:vIdDataSorce},{name:'p_title',value:vReportTitle}];
                    sendNameReport({pUrl:vUrl,pParam:vParam,pArrayItem:vArrayItem});
                  }
                  else{
                    $("input[name='p_title']").addClass('error');
                  }
                }
              });
              //cancel 
              cancelAddReports();
            }else{
              vArrayItem = [{name:'p_env_fk',value:vIdApp},{name:'p_datasorce_app',value:vIdDataSorce},{name:'p_title',value:vReportTitle}];
              sendNameReport({pUrl:vUrl,pParam:vParam,pArrayItem:vArrayItem});
            }
          }
        }
        else{
          requiredFild();
        }
        break;
        case 'alert_submit':
        if(vIdResports != null){
          if(vDoc!= null){
            var vInputKey = '';
            $('*[key="true"]',vDoc).each(function(ikey,ekey){
              if ($(ekey).text() != '') {
                vInputKey += '<div class="col-1-2"><input type="checkbox" value="'+$(ekey).attr('rel')+'" name="p_'+$(ekey).attr('rel')+'">'+sTrXsl($(ekey).text()).capitalizeFirstLetter()+'</input></div>';
              }
            });
          }
          if (vInputKey!= ''){
            vInputKey ='<div class="igrp_item">'+vInputKey+'</div>';
            $('.title','#reportTitle').html('Escolha a(s) chave(s)');
            $('.message','#reportTitle').html(vInputKey);
            IGRP_blackBody({pType:true});
            $('#reportTitle').data('key','true').addClass('active');

            var vInputKeys = [];
            vUrl = IGRP_getUrl(vUrl)+'p_env_fk='+vIdApp+'&p_datasorce_app='+vIdDataSorce+'&p_id='+vIdResports;
            $("#reportTitle").unbind("click").on('click','#btrOK',function(){
              if ($("#reportTitle").data('key') == 'true') {
                $('input:checked',$('.message','#reportTitle')).each(function(ikey,ekey){
                  vInputKeys.push($(ekey).val());
                });
                
                if(vInputKeys.length > 0){
                  vUrl+='&p_keys='+vInputKeys;
                }
                IGRP_openWin({pUrl:vUrl,
                  pWidth:($(window).width()-100),
                  pHeight:($(window).height()-100),
                  pWin:'Preview Report'
                });
                vInputKeys = [];
                IGRP_blackBody({pType:false});
                $('#reportTitle').data('key','false').removeClass('active');
              }
            });
            cancelAddReports();
          }else{
            IGRP_openWin({pUrl:vUrl,
              pWidth:($(window).width()-100),
              pHeight:($(window).height()-100),
              pWin:'Preview Report'
            });
          }
        }else{
          vPreview = true;
          $('.bWebReport[target="submit"]').trigger('click');
        }
        break;
        default:
      }
      return false;
    });
  }
 
 function reportDraggble(){
  $('.drag').draggable({
      helper:'clone',
      iframeFix: true,
      cursor: "move"
    });
 }
 

  CKEDITOR.on('instanceReady', function (ev) { 
    ev.editor.execCommand( 'removeFormat', ev.editor.getSelection() ); 
    vDoc = $('.cke_contents').find('iframe').contents().find('body');
    reportDraggble();

    $('.cke_contents').droppable({
      accept:'.drag',
      drop:function(e,ui){
        var vThis = ui.helper;
        
        var vText     = vThis.text(),
          vTag        = '['+vText+']',
          vThisParent = vThis.parents('li'),
          vType       = vThisParent.attr('type'),
          vRel        = vThisParent.attr('rel'),
          vPos        = vThis.parents('li.head').attr('pos'),
          vElement    = vThisParent.attr('tag'),
          vNoType     = vThisParent.attr('notype'),
          vNo         = vThis.parents('li.no:first').attr('no'),
          vKey        = vThisParent.attr('key'),
          vTagType    = vThisParent.attr('tagtype')?vThisParent.attr('tagtype'):'list',
          vHtml       = (vKey == 'true')?'<span key="true" rel="'+vRel+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>':'<span rel="'+vRel+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>';
          
        if(vElement == 'table'){
          vRel = (vType == 'node')?vRel:vThis.parents('ul').attr('rel');
          var vSetItem = true, vTable = $('table[rel="'+vRel+'"]',vDoc);

          if(!vTable[0]){
            vItem = [];
            vTagItem = [];
          }
          
          if(vType == 'node') {
            var vCol = $('ul[rel="'+vRel+'"]',vThisParent).attr('col');
            readItemArray({pObj:vTable,pType:vType,pCol:vCol});
            $('ul[rel="'+vRel+'"] li a span',vThisParent).each(function(e,i){
              var vThisText = $(this).text(), vThisRel = $(this).parents('li').attr('rel');
              vSetItem = setItemArray(vThisText,vThisRel);
              //setItemArrayTable({name:vThisRel,value:vThisText});
            });
            
          }else{
            readItemArray({pObj:vTable,pItem:vText,pRel:vRel});
            vSetItem = setItemArray(vText,vThisParent.attr('rel'));
            //setItemArrayTable({name:vText,value:vThisParent.attr('rel')});
          }
         // readArrayTable(vRel);
          /*TAVARES*/
          //console.log(vArrayTable);
          if(vSetItem){
            if(vTable[0]){
              vTable.remove();
            }
              
            var table = creatTabel(vItem);
            vHtml = '<table rel="'+vRel+'" type="'+vTagType+'" pos="'+vPos+'" class="IGRP_table default-table">'+
              '<thead><tr>'+table.th+'</tr></thead>'+
              '<tbody><tr>'+table.td+'</tr></tbody></table>';
          }
          else
            vHtml = null;

        }else if(vElement == 'image'){
          vHtml = '<img src="'+path+'/iconApp/default.png" pos="'+vPos+'" no="'+vNo+'" rel="'+rel+'" style="height:80px; margin:5px; width:80px"/>';
        }else if(vElement == 'chart'){
          vHtml = null;
          var chartType = vThisParent.attr('charttype'), vChartExist = false, vChartExistVal = null;
          var vUrl = $("input[name='p_env_frm_url']").val();
          //var vUrl ='http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml';
          vArrayCharts.forEach(function(e,i){
            if (e.name == vRel){
              vChartExist = true;
              vChartExistVal = e.value;
            }
          });
          
          if (vChartExist) {
            if(vChartExistVal!= null){
              CKEDITOR.instances['p_report_editor'].insertHtml(vChartExistVal);
              CKEDITOR.instances['p_report_editor'].insertHtml(' ');
            }
          }else{
            IGRP_submitAjax({
              pUrl:vUrl,
              pTransf:true,
              pDiv:$('.gTransform','#transfome'),
              pMatch:'rows content > '+vRel,
              pXsl:path+"/xsl/tmpl/IGRP-graph.tmpl.xsl",
              pComplete:function(){
                var vDwidth ='400';
                setTimeout(function(){
                  vDwidth = $('.gTransform','#transfome').width();
                  if(chartType != 'tablecharts'){
                    $('g.highcharts-button',$(".gTransform",'#transfome')).remove();
                    $(".gTransform .highcharts-container svg",'#transfome').toImage();
                  }
                },1000);
                setTimeout(function(){
                  var vHtmlData = (chartType == 'tablecharts')?$(".gTransform .table_graph",'#transfome').html():
                    $(".gTransform .highcharts-container",'#transfome').html();
                  vHtml = '<span rel="'+vRel+'" pos="'+vPos+'" chartType="'+chartType+'" class="col" style="'+vDwidth+'px">'+
                    vHtmlData+'</span>';
                    console.log(vHtml);
                  vArrayCharts.push({name:vRel,value:vHtml});
                  CKEDITOR.instances['p_report_editor'].insertHtml(vHtml);
                  CKEDITOR.instances['p_report_editor'].insertHtml(' ');
                  $(".gTransform .IGRP_graph",'#transfome').highcharts().destroy();
                  $('.gTransform .IGRP_graph','#transfome').remove();
                  $('.gTransform','#transfome').html('');
                  vChart = true;
                },1100);
              }
            });
          }
        }else{
          if(vNoType == 'select' || vNoType == 'selectlist' || vNoType == 'checkboxlist' || vNoType == 'link'){
            vHtml = (vKey == 'true')?'<span key="true" rel="'+vRel+'" type="'+vNoType+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>':
              '<span rel="'+vRel+'" type="'+vNoType+'" no="'+vNo+'" pos="'+vPos+'">'+vTag+'</span>';
          }
        }

        if(vHtml!= null){
          CKEDITOR.instances['p_report_editor'].insertHtml(vHtml);
          CKEDITOR.instances['p_report_editor'].insertHtml(' ');
        }
      }
    });
  });

  $('body').on('change','#p_datasorce_app',function(){
    $('#p_datasorce_app_chosen a').removeClass('error');
    var vVal = $(this).val(), vName = $(this).attr('name'),
      vUrl = $("input[name='p_link_source']").val()+vVal;
      //vUrl = 'http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml',
    if (vVal != '' && vVal != null) {
      vIdDataSorce = vVal;
      IGRP_submitAjax({
        pUrl:vUrl,
        pTransf:true,
        pDiv:$('#listElement'),
        pXsl:path+"/extensions/webReport/xsl/IGRP-datasorce.tmpl.xsl",
        pComplete:function(){
          reportDraggble();
          if ($('#addDataSource').attr('href')) {
            $('#editDataSource').attr('href',IGRP_getUrl($('#addDataSource').attr('href'))+vName+'='+vIdDataSorce);
            $('#editDataSource').addClass('active');
          }
        }
      });
      vItem = [];
      vTagItem = [];
    }else{
      $('#listElement').html('');
      vIdDataSorce = null;
    }
  });

  function remoteCombobox(pObj){
    var vOption = null, vOptionSelect = false;
    if (pObj.pXml!='') {
      $("option",pObj.pSel).remove();
      pObj.pSel.trigger("chosen:updated");

      pObj.pXml.find('option').each(function(i,e){
        var vText = $(e).find("text").text(),
          vOptionVal = $(e).find("value").text();
        try{
          vOptionSelect = $(e).attr('selected');
        }catch(e){null;}

        vOption = new Option(vText, vOptionVal);

        if (vOptionSelect)
          vOption.selected = true;

        pObj.pSel.append(vOption);
      });
      pObj.pSel.trigger("chosen:updated");
    }
    pObj.pSel.trigger('change');
  }

  $('body').on('change','#p_env_fk',function(){
    $('#p_env_fk_chosen a').removeClass('error');
    var vVal = $(this).val(), vName = $(this).attr('name'),
      vUrl = $("input[name='p_env_frm_url']").val(),
      vSelectDataSorce = $("select[name='p_datasorce_app']");
      //vUrl = 'http://igrpresp.teste.gov.cv/images/IGRP/app/RED/xml/RED_REPORT_REP_dash.xml',
    if (vVal != '' && vVal != null) {
      $('.addReports').addClass('active');
      var vData = vName+'='+vVal;
      vIdApp = vVal;
      IGRP_submitAjax({
        pUrl:vUrl,
        pData:vData,
        pTransf:true,
        pDiv:$('#listReports'),
        pXsl:path+"/extensions/webReport/xsl/IGRP-reports.tmpl.xsl",
        pAjaxComplete:function(data){
          var vXml = $(data.responseXML).find('list datasorce_app');
          var vLink = $(data.responseXML).find('value link_add_source').text();
          if (vLink!= null && vLink!= ''){
            $('.addDataSource').attr('href',vLink);
            $('#addDataSource').addClass('active');
          }

          remoteCombobox({pXml:vXml,pSel:vSelectDataSorce});
        }
      });
      vItem = [];
      vTagItem = [];
    }else{
      $('.addReports').removeClass('active');
      $('.addDataSource').removeClass('active');
      $('#listReports').html('');
      vIdApp = null;
      vIdResports = null;
      CKEDITOR.instances['p_report_editor'].setData('');
      vSelectDataSorce.find("option").removeAttr("selected");
      vSelectDataSorce.trigger("chosen:updated");
      vSelectDataSorce.trigger('change');
    }
  });

  $('body').on('click','.linkReports',function(){
    vIdResports = $(this).attr('id');
    $('.linkReports').removeClass('active');
    var vThis = $(this);
    IGRP_submitAjax({
      pUrl:$(this).attr('rel'),
      pAjaxComplete:function(data){
        var vText = data.responseText.replace(/\s+/g," ");
        var vJson = $.parseJSON(vText);
        CKEDITOR.instances['p_report_editor'].setData(vJson.textreport);
        vThis.addClass('active');
        var vIdSel = vJson.datasorce_app;
        if (vIdSel != '' && vIdSel != null) {
          var vSelectDataSorce = $("select[name='p_datasorce_app']");
          vSelectDataSorce.find("option").removeAttr("selected");
          vSelectDataSorce.find("option").each(function(i,e){
            if ($(e).val() == vIdSel) {
              $(e).attr("selected","selected");
            }
          });
          vSelectDataSorce.trigger("chosen:updated");
          vSelectDataSorce.trigger('change');
        }
      }
    });
    vItem = [];
    vTagItem = [];
  });
  
  buttonWebReportClick();
});