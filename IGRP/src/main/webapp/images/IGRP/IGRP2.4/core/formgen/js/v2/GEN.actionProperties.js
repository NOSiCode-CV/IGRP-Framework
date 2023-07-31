(function () {
  var GEN = VARS.getGen();

  GEN.defineGlobalProperty(
    "button-appearance-properties",
    (object, defaults = {}) => {
      var pref = defaults.classPrefix ? defaults.classPrefix + " " : "";
      var _default = defaults.class;
	  var name = defaults.name || "class";

      object.setPropriety({
        name: name,
		label : name,
		isField: defaults.isField,
        value: {
          value: _default ? _default : "primary",
          size: "12",
          list: {
            items: [
              { label: $.IGRP.locale.get("Primary"), value: pref + "primary" },
              {
                label: $.IGRP.locale.get("Secondary"),
                value: pref + "secondary",
              },
              { label: $.IGRP.locale.get("Success"), value: pref + "success" },
              { label: $.IGRP.locale.get("Info"), value: pref + "info" },
              { label: $.IGRP.locale.get("Warning"), value: pref + "warning" },
              { label: $.IGRP.locale.get("Danger"), value: pref + "danger" },
              { label: $.IGRP.locale.get("Dark"), value: pref + "dark" },
              { label: $.IGRP.locale.get("Light"), value: pref + "light" },
              {
                label: $.IGRP.locale.get("Link"),
                value: pref + "link-primary",
              },
            ],
            itemTemplate: ({ label, value }) => {
              value = value.indexOf("link") >= 0 ? value : "btn-" + value;
              return `<span class="btn btn-sm  ${value}">${label}</span>`;
            },
          },
        },
        onEditionStart: function (o) {
          const bt_class = "btn-sm btn d-flex align-items-center";

          var checkClss = function (v) {
            var val = v || object.GET[name]();

            setTimeout(function () {
              if (val?.indexOf("link-") >= 0) {
                $('[item-name="edit-btnStyle"]').hide();
              } else {
                $('[item-name="edit-btnStyle"]').show();
              }

              $('[item-name="edit-btnStyle"] .btn-style-item button').each(
                function (i, el) {
                  var style = $(this).parent().attr("value");
                  $(this).attr("class", bt_class + " " + style + "-" + val);
                }
              );
            }, 100);
          };

          $('#gen-edition-modal [item-name="edit-class"] .btn').on(
            "click",
            function () {
              var val = $(this).attr("value"); //?.split('btn-')[1]

              checkClss(val);
            }
          );

          checkClss();
        },
      });
	  
	  defaults.showbtnStyle !== false && 
      object.setProperty({
        name: "btnStyle",
        label: "Estilo de Botões",
        value: {
          value: "btn",
          size: "12",
          list: {
            items: [
              { value: "btn", label: "Normal" },
              { value: "btn-soft", label: "Suave" },
              { value: "btn-outline", label: "Linha" },
              { value: "btn-ghost", label: "Transparente" },
            ],
            itemTemplate: ({ label, value }) =>
              `<div class="me-2 btn-style-item">
						<button class="btn-sm btn ${value}-primary d-flex align-items-center">
							${label}
						</button>
					</div>`,
          },
        },
      });
    }
  );

  GEN.defineGlobalProperty(
		"icons-property", 
		(object, defaults = {}) => {	
			var name = defaults.name ? defaults.name : "img";
			var showPosition = defaults.showPosition  === false ? false : true;
			object.setPropriety({
				name: "iconColor",
				value: object.proprieties.iconColor
					? object.proprieties.iconColor
					: "#333",
				editable: false,
			});

			object.setPropriety({
				name: "iconClass",
				value: object.proprieties.iconClass ? object.proprieties.iconClass : "",
				editable: false,
			});

			object.setPropriety({
				name: name,
				label: "Icon",
				type: "attrvalue",
				value: {
					value: defaults.value,
					size: "12",
					class: "gen-fa-icon-setter",
					//color : object.GET.iconColor(),
					icon: "",
					setter: function () {
						var holder = $(VARS.fontawesome.setter).clone(true);

						var img = object.GET[name]();

						holder.attr("attr-value", img);

						holder.trigger("attr-value-change", [img]);

						var activeItem = $('.gen-fa-icon[rel="' + img + '"]', holder);

						var activeParent = activeItem.attr("parent");

						activeItem.addClass("active");

						$(".nav-tabs>li", holder).removeClass("active");

						$(".tab-pane", holder).removeClass("active in");

						$('.nav-tabs>li[rel="' + activeParent + '"]', holder).addClass(
							"active"
						);

						$(".tab-pane#gen-fa-" + activeParent, holder).addClass("active in");

						holder.on("click", ".gen-fa-icon", function () {
							var rel = $(this).attr("rel");

							$(".gen-fa-icon", holder).removeClass("active");

							$(this).addClass("active");

							holder.attr("attr-value", rel);

							holder.trigger("attr-value-change", [rel]);

							//object.SET[name]( rel );
						});

						setTimeout(function () {
							try {
								$(".tab-content").animate(
									{
										scrollTop: activeItem.position().top,
									},
									400
								);
							} catch (err) {
								console.log(err);
								return;
							}

							//$('.nav-tabs',holder).tabdrop();
						}, 250);

						return holder;
					},
					onChange: function (v) {},
				},
				isField: defaults.isField,
				valuePersist: defaults.valuePersist,
			});
			
			if(showPosition)
				(function () {
					var faSetter = () => $(".gen-fa-setter");
					var btnClssSetter = () => $('.propriety-setter[rel="class"]');
					var btnStyleSetter = () => $('.propriety-setter[rel="btnStyle"]');
					var labelSetter = () => $('.propriety-setter[rel="label"]');
					//var set
					object.setPropriety({
						name: "iconPosition",
						label: "Posição do Icon",
						value: {
							value: object.proprieties.iconPosition
								? object.proprieties.iconPosition
								: "left",
							list: {
								items: [
									{ value: "left", label: "Esquerda" },
									{ value: "right", label: "Direita" },
								],
								itemTemplate: ({ label, value }) => {
									const icon =
										faSetter().attr("attr-value") || `ri-arrow-${value}-line`;
									const _label = object.GET.label ? object.GET.label() : label;
									const clss = btnClssSetter().val();
									const style = btnStyleSetter().val();

									return `<div>
									<a icon-position="${value}" href="#" class=" btn-label  btn btn-sm ${style}-${clss} icon-position-prop d-flex align-items-center">
										<i class="label-icon fa ${icon}"></i>
										<span  class="btn-text" text="${
											value == "right" ? "Direita" : "Esquerda"
										}">${_label}</span>
									</a>
								</div>`;
								},
							},
						},
						onEditionStart: (v) => {
							var setBtnClss = () => {
								$(".icon-position-prop", v.input).each((i, el) => {
									const prefix = "btn-";
									const classes = el.className
										.split(" ")
										.filter((c) => !c.startsWith(prefix));
									const clss = btnClssSetter().val();
									const style = btnStyleSetter().val();

									el.className =
										classes.join(" ").trim() + ` ${style}-${clss} btn-label btn-sm`;
								});
							};

							btnClssSetter().on("change", setBtnClss);

							btnStyleSetter().on("change", setBtnClss);

							labelSetter().on("blur", () => {
								$(".btn-text", v.input).each((i, t) => {
									$(t).text(labelSetter().val() || $(t).attr("text"));
								});
							});

							faSetter().on("attr-value-change", (e, icon) => {
								$(".icon-position-prop", v.input)
									.find("i")
									.attr("class", `label-icon fa ${icon}`);
							});
						},
					});
				})();
  });

  GEN.defineGlobalProperty(
    "action-properties",
    (object, defaults = {}) => {
      //set options value
      //var options = [{ value:GEN.DETAILS.page, label:GEN.DETAILS.page_descr }];
      var options = [];
      var value = defaults.value;
      var tagName = defaults.tag || "action";
      var type = defaults.type || "text";

      var setBTNAction = function (id) {
        if (options[0])
          for (var i = 0; i < options.length; i++) {
            var o = options[i];
            object.action = {};

            if (o.value && id == o.value) {
              o.attributes.forEach(function (att) {
                object.action[att.name] = att.value;
              });

              if (defaults.onChange)
                defaults.onChange({
                  value: id,
                  params: object.action,
                });

              break;
            }
          }
      };

      if (GEN.DETAILS.linkPageList && GEN.DETAILS.linkPageList[0])
        GEN.DETAILS.linkPageList.forEach(function (page) {
          options.push({
            value: page.page.toString(),
            label: page.description,
            attributes: [
              { name: "app", value: page.app },
              { name: "page", value: page.page },
              { name: "action", value: page.action },
              { name: "link", value: /*GEN.UTILS.link_preview+*/ page.link },
            ],
          });
        });

      if (typeof defaults.value == "object") {
        for (var i = 0; i < options.length; i++) {
          var o = options[i];
          if (
            o.attributes &&
            o.attributes[0].value == defaults.value.app &&
            o.attributes[1].value == defaults.value.page &&
            o.attributes[2].value == defaults.value.action
          ) {
            value = o.value;
            object.proprieties.action = value;
          }
        }
      }

      var params = {
        name: tagName,
		label:$.IGRP.locale?.get('gen-button-action'),
        value: {
          value: value ? value : GEN.DETAILS.id,
          options: options,
          type: type,
        },
        fieldType: defaults.fieldType,
        isField: defaults.isField || false,
        valuePersist: defaults.valuePersist || false,
        onChange: function (val) {
          var val = object.GET[tagName](),
            isNum = /^\d+$/.test(val);

          if (isNum) {
            for (var i = 0; i < GEN.DETAILS.linkPageList.length; i++) {
              var pg = GEN.DETAILS.linkPageList[i];
              if (pg.id == val) {
                val = pg.page;
                break;
              }
            }
          }
          setBTNAction(val);
        },
      };

      if (defaults.order >= 0) params.order = defaults.order;

      if (defaults.xmlAttr) params.xmlAttr = defaults.xmlAttr;

      object.setPropriety(params);

      if (defaults.customAction) {
        object.setPropriety({
          name: "custom_action",
          label: "Custom Action",
          value: "",
          order: defaults.order || -1,
          //size : 12
        });

        object.setPropriety({
          name: "action_type",
          label: "Custom Action",
          value: false,
          onEditionStart: function (o) {
            var customHolder = $(
                '.gen-properties-setts-holder>[rel="custom_action"]'
              ),
              actionHolder = $('.gen-properties-setts-holder>[rel="action"]');

            var checkTypes = function (v) {
              if (v) {
                customHolder.show();

                actionHolder.hide();

                //customHolder.insertAt(  )
              } else {
                customHolder.hide();

                actionHolder.show();
              }
            };

            o.input.on("change", function () {
              var value = $(this).find("input").is(":checked");

              checkTypes(value);
            });

            checkTypes(o.value);
          },
        });
      }

      var val = object.GET[tagName](),
        isNum = /^\d+$/.test(val);

      if (isNum) {
        for (var i = 0; i < GEN.DETAILS.linkPageList.length; i++) {
          var pg = GEN.DETAILS.linkPageList[i];

          if (pg.id == val) {
            val = pg.page;

            break;
          }
        }
      }

      setBTNAction(val);
    }
  );


	GEN.defineGlobalProperty(
		'action-target-properties',
		(field,p={})=>{
			var targetRulesSet = false;
			const nosicaSignerIncludesFiles = function(field,v){

				const flIncludes = {
					css :[
						{ path:'/plugins/select2/select2.style.css' },
						{ path:'/plugins/select2/select2.min.css' },
						{ path:'/plugins/virtualkeyboard/vkb.css' }
					],
					js  : [
						{ path:'/plugins/nosicaSigner/nosicaSigner.js'},
						{ path:'/plugins/select2/select2.init.js'},
						{ path:'/plugins/select2/select2.full.min.js'},
						{ path:'/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js'}
						
					]
				};
		
				if(v.includes('signer')){
					flIncludes.js.forEach(function (e) {
						field.includes.js.unshift(e);
					});
		
					flIncludes.css.forEach(function (e) {
						field.includes.css.unshift(e);
					});
		
				}else{
					GEN.removeIncluds(flIncludes.js,'js',field);
					GEN.removeIncluds(flIncludes.css,'css',field);
				}
			}
			
			field.setPropriety({
				name: 'target',
				label : $.IGRP.locale.get('gen-button-target'),
				value:{
					value:p.value ? p.value : '_blank',
					options: $.IGRP.defaults.buttons.targets()
				},
				onChange:function(v){
					
					if(field.SET.list_source && v != 'listAssociation')
						
						field.SET.list_source('');
	
					nosicaSignerIncludesFiles(field,v);
						
				},
				onEditionStart : function(o){
	
					const target = field.GET.target ? field.GET.target() : null;
	
					nosicaSignerIncludesFiles(field,target);
					
				}
				
			});
	
			field.setPropriety({
				label 	 : 'Request Fields',
				name     : 'request_fields',
				order	 : 5,			
				value    : {
					value : '',
					options : function(){
						var options = [];
						GEN.getAllFields().forEach(function(f){
							options.push({
								label : f.GET.label ? f.GET.label() : f.GET.tag(),
								value : f.GET.name()
							});
						});
						return options;
					},
					multiple : true
				},
				onEditionStart : function(o){
					
					var checkTarget = function(v){
						var val = v ? v : field.GET.target ? field.GET.target() : null;
	
						var target = val || null;
	
						if( target == 'remote_call')
							o.input.show();
						else
							o.input.hide();
					}
	
					$('select[name="edit-target"]').on('change',function(){
						var target = $(this).val();
						checkTarget(target);
					});
	
					checkTarget();
	
				}
			});
	
			field.setPropriety({
				label 	 : 'Fields',
				name     :'target_fields',
				value    : {
					value : '',
					options : GEN.getSrcFields
				},
				onEditionStart : function(o){
	
					if( field.GET.target && (field.GET.target() == "exportall" || field.GET.target() == "changesrc"))
						o.input.show();
					else
						o.input.hide();
					
				}
			});
			
			var RemoveAssociationFeatures = function(field, list){
				
				var parentTag = field.id;
				
				var targetHiddenField = field.parent.GET.fieldByTag( parentTag+'_association_id' );
				
				if(targetHiddenField)
	
					field.parent.removeField( targetHiddenField.id, false, false );
				
				field.parent.customStyle.class = field.parent.customStyle.class.replaceAll('list-association-target','');
				
				setTimeout(function(){
					
					if(list){
						
						var sourceHiddenField = list.GET.fieldByTag( parentTag+'_association_rel' );
						
						list.customStyle.class = list.customStyle.class.replaceAll('list-association-source','');
						
						if(sourceHiddenField)
	
							list.removeField( sourceHiddenField.id, false );
						
						delete list.htmlAttributes['association-target-name'];
	
					}
					
				}, 350);
				
			};
			
			if(field.parent && field.parent.xml && field.parent.xml.table ){
				
				field.setPropriety({
					label 	 : 'List Source',
					name     :'list_source',
					order    : 3,
					value    : {
						value : '',
						options : function(){
							
							var options = [{
								
								label : '', value : ''
									
							}];
							
							GEN.getContainers().forEach(function(c){
	
								if(field.parent.GET.tag() != c.GET.tag() && c.xml.table)
									
									options.push({
										
										label : c.GET.tag(),
										
										value : c.id
										
									});
								
							});
						
							return options;
							
						}
					},
					
					onEditionStart : function(e){
						
						var holder = e.input;
						
						var toggle = function(v){
							
							var val    = v || field.GET.target(),
							
								action = val == 'listAssociation' ? 'show' : 'hide';
							
							holder[action]();
							
						};
				
						$('.propriety-setter[rel="target"]').on('change', function(){
							
							toggle( $(this).val() );
							
						});
						
						toggle();
						
					},
					onChange:function(v,params){
						
						try{
	
							if(v){
								
								var list 				= GEN.getContainer(v),
								
									setFieldCallback = function(list){
									
										var parentTag = field.id;
									
										var sourceHiddenField = list.GET.fieldByTag( parentTag+'_association_rel' ),
										
											targetHiddenField = field.parent.GET.fieldByTag(parentTag+'_association_id'),
											
											hiddenClass	      = GEN.getDeclaredField('hidden');
										
										list.htmlAttributes['association-target-name'] = field.parent.GET.tag();
										
										if(!targetHiddenField){
											
											var targetHiddenField = new hiddenClass.field('hidden',{});
											
											targetHiddenField.SET.tag( parentTag+'_association_id' );
											
											field.parent.SET.fields( [targetHiddenField] );
											
										}
										
										if(!sourceHiddenField){
											
											var sourceHiddenField = new hiddenClass.field('hidden', {} );
									
											sourceHiddenField.SET.tag( parentTag+'_association_rel' );
											
											list.customStyle.class = list.customStyle.class+' list-association-source';
											
											field.parent.customStyle.class = field.parent.customStyle.class+' list-association-target';
											
											list.SET.fields([sourceHiddenField]);
											
											/*field.parent.holder.on('tag-change', function(e,tag){
											
												sourceHiddenField.SET.tag( tag+'_lst_association_rel' );
												
												sourceHiddenField.parent.Transform();
												
											});*/
											
											
										}
									
									}
								
								if(list)
									
									setFieldCallback(list);
									
								else
									
									GEN.dom.on('container-set', function(e,container){
								
										if(container.id == v)
										
											setFieldCallback(container);
	
									});
									
							}else{
								
								var list = params.oldValue ?  GEN.getContainer(params.oldValue) : false;
								
								RemoveAssociationFeatures(field, list);
								
							}
	
						}catch(e){
							
							console.log(e);
							
						}
						
					}
					
				});
				
				field.parent.holder.on('field-remove', function(e,field){
					
					if(field.GET.list_source && field.GET.list_source()){
						
						var list = GEN.getContainer( field.GET.list_source() );
	
						RemoveAssociationFeatures( field, list );
					}
					
				});
				
			}
	
			field.setPropriety({
				name    :'closerefresh',
				label   :'Refresh Parent',
				value   :false,
				xslValue:'close="refresh"',
				onEditionStart : function(o){
					
					if(
						field.GET.target && field.GET.target() == 'modal' ||
						field.GET.target && field.GET.target() == 'right_panel' || 
							 field.GET.target && field.GET.target() == 'mpsubmit'   || 
							 field.GET.target && field.GET.target() == 'right_panel_submit'
					)
	
						o.input.show();
	
					else
						
						o.input.hide();
	
				}
	
			});
			
			field.setPropriety({
				name    :'refresh_components',
				label   :'Reload Components',
				order   : 3,
				
				value   :{
					value : '',
					multiple : true,
					options : function(){
						
						var comArr = [];
						
						GEN.getContainers().forEach(function(com){
							
							comArr.push({
								value : com.GET.tag(),
								label : com.GET.tag()
							})
							
						})
						
						return comArr;
						
					}
				},
				onEditionStart : function(o){
					
					var toggle = function(v){
						
						//var _target = v || ( field.GET.target ?  field.GET.target : null),
						var _target = v || ( field.GET.target ?  field.GET.target() : null),
						
							action  = (_target == 'submit_ajax' || _target == 'submit_notvalidate'  || _target == 'submitpage2file') ? 'show' : 'hide'; 
						
						o.input[action]();
						
					};
					
					$('#gen-edition-modal select[name="edit-target"]').on('change', function(){
						
						toggle( $(this).val() );
						
					});
					
					toggle();
	
				}
	
			});
			
			field.setPropriety({
				name    :'refresh_submit',
				label   :'Submit',
				value   :false,
				xslValue:'refresh-submit="true"',
				onEditionStart : function(o){
					
					setTimeout(function(){
						
						var ctrlSelector = '.propriety-setter.checker[rel="closerefresh"]';
						
						var checkVisibility = function(){
							
							var closeref = $(ctrlSelector),
							
								action = closeref.is(':checked') ? 'show' : 'hide';
	
							o.input[action]();
							
						};
						
						$('#gen-edition-modal').on('change', ctrlSelector, checkVisibility);
						
						checkVisibility();
						
					},250);
					
	
				}
	
			});
			
			var jsIncludes = [
				{ path: '/plugins/sharpadbclient/sharpadbclient.js' }
			];
		
			field.setPropriety({
				label: 'Sharp Adb Client Action',
				name: 'adbcli',
				order: 6,
				value: {
					value: '',
					options: $.IGRP.defaults.buttons.sharpadbclient
				}, 
				onEditionStart: function (o) {
		
					var checkTarget = function (v) {
						var target = v ? v : field.GET.target ? field.GET.target() : null;
		
						if (target == 'sharpadbclient') {
		
							o.input.show();
		
							jsIncludes.forEach(function (e) {
								field.includes.js.unshift(e);
							});
						}
		
						else {
							if ($.IGRP.components.select2) {
								$.IGRP.components.select2.select2Init({
									field: $('select', o.input)
								});
							}
		
							o.input.hide();
		
							GEN.removeIncluds(jsIncludes, 'js',field);
						}
					}
		
					$('select[name="edit-target"]').on('change', function () {
						checkTarget($(this).val());
					});
		
					checkTarget();
				}
			});
			
			if(!targetRulesSet){
				$.IGRP.rules.set({"edit-target":[
					{"name":"","event":"change","condition":"equal","value":"changesrc","value2":"","patern":"","patern_custom":"","action":"show","targets":"edit-target_fields","procedure":"","msg_type":"","msg":"","opposite":"1","isTable":false},
					{"name":"","event":"change","condition":"equal","value":"modal","value2":"","patern":"","patern_custom":"","action":"show","targets":"edit-closerefresh","procedure":"","msg_type":"","msg":"","opposite":"1","isTable":false},
					{"name":"","event":"change","condition":"equal","value":"right_panel","value2":"","patern":"","patern_custom":"","action":"show","targets":"edit-closerefresh","procedure":"","msg_type":"","msg":"","opposite":"","isTable":false},
					{"name":"","event":"change","condition":"equal","value":"mpsubmit","value2":"","patern":"","patern_custom":"","action":"show","targets":"edit-closerefresh","procedure":"","msg_type":"","msg":"","opposite":"","isTable":false},
					{"name":"","event":"change","condition":"equal","value":"right_panel_submit","value2":"","patern":"","patern_custom":"","action":"show","targets":"edit-closerefresh","procedure":"","msg_type":"","msg":"","opposite":"","isTable":false}
				]});
				targetRulesSet = true;
			}
		}
	)
})();
