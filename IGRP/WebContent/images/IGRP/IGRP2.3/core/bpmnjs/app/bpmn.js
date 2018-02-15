(function(){
   var com,
      bpmn = {};

   bpmn.id   = '';
   bpmn.title= $('#igrp-app-title').text();
   bpmn.app  = $('#form_1_env_fk').val();
   bpmn.new  = path+'/core/bpmnjs/app/xml/newDiagram.bpmn';

   $.IGRP.component('bpmn',{
      importXML : function(l){
         $.get(l, function(xml){
           
            xml = com.oiXml(xml);

            console.log(xml);

            BPMN.importXML(xml, function(err) {
               if (err) {
                  $('body').removeClass('shown');
                  console.error(err);
               } else
                  $('body').addClass('shown');
            });
         },'text');
      },
      minify : function(xml){
         return xml.replace(/^\s+|\r\n|\n|\r|(>)\s+(<)|\s+$/gm, '$1$2');
      },
      activiteToOi : function(xml){
         
         var cont  = xml.split('<extensionElementsIO>').length - 1,
            newXml = '';

         if (cont) {
            var starXml = xml.substring(0,xml.indexOf('<extensionElementsIO>')+21).replace(/extensionElementsIO/g, 'extensionElements'),
               field    = xml.substring(xml.indexOf('<activiti:formProperty'),xml.indexOf('</extensionElementsIO>')).replace(/activiti:formProperty/g, 'camunda:formField'),
               endXml   = xml.substring(xml.indexOf('</extensionElementsIO>')+22,xml.length);

            newXml = com.activiteToOi(starXml+'<camunda:formData>'+field+'</camunda:formData></extensionElements>'+endXml);
         }else
            newXml = xml;

         return newXml;
      },
      oiXml : function(xml){
         xml = $.parseXML(xml);
         xml = (new XMLSerializer()).serializeToString(xml);

         xml = com.minify(xml).replace(/extensionElements/g, 'extensionElementsIO')
            .replace(/<omgdc:/g, '<dc:').replace(/<omgdi:/g, '<di:');

         var starIoXml = '<?xml version="1.0" encoding="UTF-8"?>'+
            '<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
            ' xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL" '+
            ' xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" '+
            ' xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" '+
            ' xmlns:di="http://www.omg.org/spec/DD/20100524/DI" '+
            ' xmlns:camunda="http://camunda.org/schema/1.0/bpmn" '+
            ' xmlns:activiti="http://activiti.org/bpmn" '+
            ' id="sample-diagram" targetNamespace="http://bpmn.io/schema/bpmn" '+
            ' xsi:schemaLocation="http://www.omg.org/spec/BPMN/20100524/MODELBPMN20.xsd">';

         ioXml = xml.substring(xml.indexOf('<process'),xml.length - 12);
         ioXml = starIoXml+ioXml+'bpmn:definitions>';

         return com.activiteToOi(xml);
      },
      oItoActivite : function(xml){
         var cont  = xml.split('<formData>').length - 1,
            newXml = '';
         
         if (cont){
            var starXml = xml.substring(0,xml.indexOf('<formData>')),
               field    = xml.substring(xml.indexOf('<formData>')+10,xml.indexOf('</formData>')).replace(/formField/g, 'activiti:formProperty'),
               endXml   = xml.substring(xml.indexOf('</formData>')+11,xml.length);

            newXml = com.oItoActivite(starXml+field+endXml);
         }
         else
            newXml = xml;

         return newXml;
      },
      activitiXml : function(xml){
         xml = $.parseXML(xml);
         xml = (new XMLSerializer()).serializeToString(xml);

         var starAtivitiXml =  '<?xml version="1.0" encoding="UTF-8"?>'+
            '<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" '+
            ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '+
            ' xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" '+
            ' xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" '+
            ' xmlns:omgdi="http://www.omg.org/spec/DD/20100524/DI" '+
            ' xmlns:xsd="http://www.w3.org/2001/XMLSchema" '+
            ' xmlns:activiti="http://activiti.org/bpmn" '+
            ' targetNamespace="http://www.activiti.org/processdef">',
            activeXml = com.minify(xml).replace(/bpmn:/g,'').replace(/camunda:/g,'')
               .replace(/<dc:/g, '<omgdc:').replace(/<di:/g, '<omgdi:');

         activeXml = activeXml.substring(activeXml.indexOf('<process'),activeXml.length);
         activeXml = starAtivitiXml+activeXml;

         return com.oItoActivite(activeXml);
      },
      saveDiagram : function(){
         $("body").on("click","#save",function(e) {
            e.preventDefault();
            var url = $('.btns-holder a[target="submit"]').attr('href');
            
            BPMN.saveXML({ format: true }, function(err, xml) {
               if (err) {
                  console.error('diagram save failed', err);
               } else{
                  var arrayItem = [];

                  if(url.indexOf("?")>-1){
                     var param = url.substring(url.indexOf("?")+1),
                        p      = param.split("&");

                     for(var i=0; i < p.length; i++){
                        var v = p[i].split("=");
                        if(v[0].toLowerCase() != "p_env_frm_url"){
                           arrayItem.push({name:v[0],value:v[1]});
                        }
                     }
                  }

                  xml = $.parseXML(com.activitiXml(xml));

                  console.log(xml);

                  arrayItem.push({name:'p_id',value:bpmn.id});
                  arrayItem.push({name:'p_env_fk',value:bpmn.app});
                  
                  $.IGRP.utils.submitStringAsFile({
                     pUrl    : url,
                     pParam  : {
                        pArrayFiles : [{name:'p_data',value:xml}],
                        pContentType: 'text/xml',
                        pFormat     : 'xml',
                        pArrayItem  : arrayItem
                     }
                  });
               } 
            });
            return false;
         });
      },
      processClick : function(){
         $("body").on("click",".treeview a[type='line'].treeClick",function(e) {
            e.preventDefault();
            var url = $(this).attr('href');

            if(url){
               $('#igrp-app-title').html(bpmn.title+' [ '+$(this).text()+'  ]');

               bpmn.id = $(this).attr('idObj');
               
               if(!$(e.target).hasClass("btn")){
                  com.importXML(url);
               }
            }
         });
      },
      appChange : function(){
         $("#form_1_env_fk").on("change",function(){
            bpmn.app = $(this).val();

            if (bpmn.app != null) {
               $('.addArea').addClass('active');
               $.ajax({
                  url  : $.IGRP.utils.getPageUrl(),
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
                     xsl       : path+"/core/bpmnjs/xsl/bpmn-tree-menu.tmpl.xsl",
                     xslParams : {template : 'tree-menu'},
                     xml       : $(data).find('rows content gen_table table').getXMLDocument(),
                     complete  : function(){
                        try{
                           com.importXML(bpmn.new);
                        }catch(e){null;}
                     }
                  });
               });
            }else
               $('.addArea').removeClass('active');
         });
      },
      btnAddEditClick : function(){
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
      },
      utils : function(){
         $('#js-properties-panel').on('click','button',function(e){
            e.preventDefault();
            return false;
         });

         $('#igrp-contents .js-panel').height($(document).height() - ($('#igrp-top-nav').height()));
      },
      init:function(){
         com = this;
         com.processClick();
         com.appChange();
         com.btnAddEditClick();
         com.utils();
         com.saveDiagram();

         console.log(BPMN);
      }
   },true);
})();