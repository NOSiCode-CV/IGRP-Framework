(function(){
   var com,
      bpmn = {};

   bpmn.id   = '';
   bpmn.title= $('#igrp-app-title').text();
   bpmn.app  = $('#form_1_env_fk').val();
   bpmn.new  = path+'/core/bpmnjs/resources/initial.bpmn';

   $.IGRP.component('bpmn',{
      importXML : function(l){
         $.get(l, function(xml){

            xml = $($.parseXML(xml)).activiti2Io();

            BPMN.importXML(xml, function(err) {
               if (err) {
                  $('body').removeClass('shown');
                  console.error(err);
               } else
                  $('body').addClass('shown');
            });
         },'text');
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

                  xml = $($.parseXML(xml)).io2Activiti();
                  
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
      }
   },true);
})();