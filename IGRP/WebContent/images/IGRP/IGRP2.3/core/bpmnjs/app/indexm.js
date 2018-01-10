var fs = require('fs');

var BpmnModeler = require('bpmn-js/lib/Modeler');

var propertiesPanelModule = require('bpmn-js-properties-panel'),
    propertiesProviderModule = require('bpmn-js-properties-panel/lib/provider/camunda'),
    camundaModdleDescriptor = require('camunda-bpmn-moddle/resources/camunda'),
    

var container = $('#js-drop-zone');

var canvas = $('#canvas');

var BPMN = new BpmnModeler({
  container: canvas,
  keyboard: { bindTo: document },
  propertiesPanel: {
    parent: '#properties'
  },
  additionalModules: [
    propertiesPanelModule,
    propertiesProviderModule
  ],
  moddleExtensions: {
    camunda: camundaModdleDescriptor
  }
});

$(function(){

    

    var diagram = {
      import : function(f){
        $.get(f, function(xml){
            BPMN.importXML(xml, function(err) {
              if (err) {
                $('body').removeClass('shown');

                //container.find('.error pre').text(err.message);

                console.error(err);
              } else{
                $('body').addClass('shown');
              } 
            });
          }, 
        'text');
      },
      setEncoded : function(p){
        var encodedData = encodeURIComponent(p.data);

        if (p.data) {
          p.o.addClass('active').attr({
            'href': 'data:application/bpmn20-xml;charset=UTF-8,' + encodedData,
            'download': p.name
          });
        } else {
          p.o.removeClass('active');
        }
      },
      load : function(){
        diagram.import('xml/newDiagram.bpmn');
      },
      get : {
        xml : function(){
          var resp = null;
          BPMN.saveXML({ format: true }, function(err, xml) {
            if (err) {
              console.error('diagram save failed', err);
            } else 
              resp = xml;
          });
          return resp;
        },
        svg : function(f){
          var resp = null;
          BPMN.saveSVG(function(err, svg){
            if (err) {
              console.error('diagram save failed', err);
            } else
              resp = svg;
          });
          return resp;
        },
        canvas : function(){
          return BPMN.get('canvas');
        }
      },
      event : {
        download : function(f){
          diagram.setEncoded({
            data : diagram.get[f.attr('type')](),
            o    : f,
            name :f.attr('download')
          });
        },
        save : function(f){
          var xml = diagram.get.xml();
          var svg = diagram.get.svg();
          console.log(xml);
          console.log(svg);
          return false;
        },
        new : function(){
          diagram.load();
        },
        zoomReset : function(){
          diagram.get.canvas().zoom(1,1);
        },
        zoomIn : function(){
          var zoom = diagram.get.canvas().zoom() + 1;
          diagram.get.canvas().zoom(zoom,zoom);
        },
        zoomOut : function(){
          var zoom = diagram.get.canvas().zoom() - 1;
          diagram.get.canvas().zoom(zoom,1);
        },
        showKeyboard : function(){
          $('#keybindings-dialog').toggleClass('open');
        }
      },
      action : function(){
        $('[jsaction]').on('click',function(e){
          e.preventDefault();
          var action = $(this).attr("jsaction").split(/:(.+$)/, 2);
          diagram.event[action[1]]($(this));
        });
      },
      init : function(){

        diagram.load();
        diagram.action();
      }
    };
    diagram.init();
    console.log( BPMN);
});