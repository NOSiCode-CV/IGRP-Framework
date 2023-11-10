(function () {
  var gen = VARS.getGen();
  gen.defineGlobalProperty("table-style", (object, defaults = {}) => {

    object?.setPropertyGroup({
			name : 'data_table',
			label : 'Opções',
			order : 3,
			properties : [
				{
					label : $.IGRP.locale.get('gen-table-has-filter'),
					name : 'has_filter',
					value: false,
					onChange:()=>{
						object.SET.filterTemplate(true);
					}
				},
        {
          editable: false,
          name : 'filterTemplate',
          value: true,
          xslValue : `
            <xsl:apply-templates mode="igrp-table-form-filter" select="${object.GET.path()}"/>
          ` 
        },
				{
					name : 'search',
					label : 'Pesquisar',
					value : false
				},
				{
					name : 'pagination',
					label : 'Paginação',
					value : true,
					onChange: ()=>{
						console.log('change');
					}
				},
				{
					name : 'length_change',
					label : 'Linhas por página',
					value : false
				},
        /*{
					name : 'length_change',
					label : 'Qtd. por página',
					value : false
				}*/
			]
		});

    object?.setPropertyGroup({
			name : 'visual',
			label : 'Aparência',
			order : 3,
			properties : [
				{
          name: "tableHeaderStyle",
          label: $.IGRP.locale.get("gen-table-header-style"),
          size: 12,
          value: {
            value: defaults.tableHeaderStyle || "table-light",
            list: {
              items: [
                { value: "", label: $.IGRP.locale.get("ui-white") },
                
                /*{ value: "table-secondary", label: $.IGRP.locale.get("ui-secondary") },
                { value: "table-success", label: $.IGRP.locale.get("ui-success") },
                { value: "table-info", label: $.IGRP.locale.get("ui-info") },
                { value: "table-warning", label: $.IGRP.locale.get("ui-warning") },
               // { value: "table-danger", label: $.IGRP.locale.get("ui-danger") },*/
                { value: "table-light", label: $.IGRP.locale.get("ui-gray") },
              
                { value: "table-primary", label: $.IGRP.locale.get("ui-primary") },
                { value: "table-dark", label: $.IGRP.locale.get("ui-dark") },
                
              ],
              itemTemplate: ({ label, value }) => {
                var bg = value.split("table-")[1];
                return `<div class="">
                            <a href="#" class="btn btn-sm btn-${bg} btn-rounded d-flex align-items-center shadow border" style="width:30px;height:30px;border-radius:100%;">
                                <span  class="btn-text"></span>
                            </a>
                        </div>`;
              },
            },
          },
        },
        {
          name: "hoverable",
          label: "Realçar",
          tip : 'Realçar linha ao passar o rato',
          value: defaults?.hoverable || true,
          xslValue: "table-hover",
        },
        {
          name: "striped",
          label: $.IGRP.locale.get('table-striped'),
          value: defaults?.striped || false,
          xslValue: "table-striped",
        },
        {
          name: "bordered",
          label: "Mostrar bordas",
          value: defaults?.bordered || false,
          xslValue: "table-bordered",
        }
			]
		});

    object?.setPropertyGroup({
			name : 'context-menu',
      label : 'Ações de Contexto',
      properties : [
        {
          name:'ctxMenuTemplate',
          value:false,
          editable:false,
          xslValue:function(){
            
            var rtn = '';
            
            if(!object.GET.ctxInlineTmpl()){
              
              rtn = '<xsl:apply-templates select="'+object.GET.path()+'/table/context-menu'+'" mode="table-context-menu">';
              
              if(object.GET.ctxType() == 'hover')
                rtn += '<xsl:with-param name="view" select="\'lavel-menu\'"/>';
    
              rtn += '</xsl:apply-templates>';
            }
            
            return rtn;
          }
        },
        {
          name:'ctxMenuClass',
          value:false,
          editable:false,
          xslValue:'IGRP_contextmenu'
        },
        {
          name:'hasContextMenu',
          value:false,
          editable:false,
          xslValue:'<xsl:apply-templates mode="context-param" select="context-menu" />'
        },
        {
          name:'ctxType',
          label: $.IGRP.locale.get('gen-contextmenu-type'),
          value:{
            value:'default',
            options:[
              {value:'default',label:'Padrão'},
              {value:'dropdown',label:'Dropdown'},
            ]
          },
          onChange:function(v){
            var ismenu = v == 'ctx' || v == 'hover' ? true : false;
            object.SET.ctxInlineTmpl(!ismenu);
          },
          onEditionStart : function(v){
           /* $('select',v.input).on('change',function(){
              var action  = $(this).val() == 'inl' ? 'show' : 'hide'; 
              $('.gen-properties-setts-holder div[rel="ctxStyle"]')[action]();
            });*/
          }
        },
        {
          name:'ctxInlineTmpl',
          label:'CtxMenu Inline',
          value:true,
          editable:false,
          onChange:function(e){
            object.SET.ctxInlineHeadTmpl(e);
          },
    
          xslValue:function(){
            var ctxType = "'"+object.GET.ctxType()+"'"
              return '<xsl:if test="//'+object.GET.path()+'/table/context-menu/item" gen-preserve="last"><td class="igrp-table-ctx-td" >'+
                  '<xsl:apply-templates select="../../context-menu'+'" mode="table-context-inline">'+
                    '<xsl:with-param name="row-params" select="context-menu"/>'+
                    '<xsl:with-param name="type" select="'+ctxType+'"/>'+
                  '</xsl:apply-templates>'+
                '</td></xsl:if>';
          }
        },
        {
          name:'ctxInlineHeadTmpl',
          editable:false,
          value:true,
          xslValue:function(){
              return '<xsl:if test="'+object.GET.path()+'/table/context-menu/item" gen-preserve="last"><th class="igrp-table-ctx-th" gen-preserve="last"></th></xsl:if>';
          }
        }
      ]
    });
    

    object.onColorFieldSet = function(field){
      //set legend xml
      object.xml.tableLegend = true;

      if(!object.proprieties.legendColors)
  
        object.setPropertyGroup({
          name:  'colors_group',
          label : $.IGRP.locale.get('gen-colors-legend'),
          properties : [
            {
              name:'legendColors',
              label : $.IGRP.locale.get('gen-colors-legend-map'),
              type : 'formlist',
              order : 25,
              group : 'visual',
              fields : {
                text : {
                  type: 'text',
                  label : 'Texto'
                },
                value : {
                  type:'text',
                  label : 'Valor'
                },
                color: {
                  type: 'color',
                  label : 'Cor'
                },
              },
              value : {
                value : defaults.proprieties && defaults.proprieties.legendColors || [
                  {
                    "color": "#dc2b4c",
                    "text": "Cor 1",
                    "value": "1"
                  },
                  {
                    "color": "#ea9126",
                    "text": "Cor 2",
                    "value": "2"
                  },
                  {
                    "color": "#95c11f",
                    "text": "Cor 3",
                    "value": "3"
                  }
                ]
              },
      
              size : 12
      
            }
          ]
        });
  
    }	
  
    object.onColorFieldRemove = function(field){
      //has no Color 
      if(!object.hasFieldType('color')) {
  
        object.unsetProprieties(['legendColors','colors_group']);
      }
    }

  });
})();
