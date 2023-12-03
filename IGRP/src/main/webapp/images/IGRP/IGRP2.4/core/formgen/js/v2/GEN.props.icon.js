(function () {
  var GEN = VARS.getGen();

  GEN.defineGlobalProperty(
		"icons-property", 
		(object, defaults = {}) => {	
			var name = defaults.name ? defaults.name : "img";
			var showPosition = defaults.showPosition  === false ? false : true;
			const groupProps = [
				{
					name:'iconLib',
					label : $.IGRP.locale.get('gen-icon-lib'),
					readonly: true,
					value: {
						value: defaults.iconLib || '',
						options : [
							{ value : '', label : 'Sem Ícone' },
							{ value : 'remix', label : 'Remix' },
							{ value : 'fontawesome', label : 'Fontawesome' }
						]
					}
				},
				{
					name: name,
					label: false,
					type: "attrvalue",
					value: {
						value: defaults.value,
						size: "12",
						class: "gen-fa-icon-setter",
						icon: "",
						setter: function () {
							var holder = $('.icon-setter-renderer')[0] ? $('.icon-setter-renderer') : $(`
								<div class="loading icon-setter-renderer">
									<ul class="nav nav-tabs mb-3 list-nav flex-nowrap overflow-auto" role="tablist" style="padding-bottom:1px;"></ul>
									<div class="tab-content text-muted"></div>
								</div>
							`);
							var modal = $('#gen-edition-modal');
							
							const renderIconSetter = (lib)=>{
	
								const defaultVal = object.GET[name]();
		
								holder.attr("attr-value", defaultVal  );
	
								holder.find('.list-nav').html('');
	
								holder.find('.tab-content').html('');
								
								holder.hide();
	
								if(lib){
									$.get(`${path}/components/icons/${lib}.json`).then((data)=>{
										Object.keys( data ).forEach((key,i)=>{
	
											const activeTab = "";
											const active = i === 0 ? 'active' : '';
											const item = data[key];
											holder.find('.list-nav').append(`
												<li class="nav-item" role="presentation">
													<a class="icon-parent nav-link fs-11 px-2 text-uppercase ${active}" data-bs-toggle="tab" key="${key}" href="#icon-${key}" role="tab">
														${key}
													</a>
												</li>
											`);
											holder.find('.tab-content').append(`
												<div class="tab-pane ${active}" id="icon-${key}" role="tabpanel">
													<div class="d-flex flex-wrap fs-16">
														${ Object.keys(item).map( (tabKey,x)=>(
															`<div class="p-2 item-selector cursor-pointer ${ item[tabKey].value == defaultVal ? 'active' : '' }" value="${item[tabKey].value}" parent="${key}">
																<i class="fa ${item[tabKey].value}"></i>
															</div>`
														) ).join('') }
													</div>
												</div>
											`);
										});
	
										holder.removeClass('loading');
	
										holder.show();

										if(defaultVal){
											const activeItem = $(`.item-selector[value="${defaultVal}"]`,holder);
											const parentKey = activeItem?.attr('parent');
											const parent = $(`.icon-parent[key="${parentKey}"]`, holder);
											var tab = new bootstrap.Tab(parent[0])
											tab.show();
										}
									});
	
								}
	
							}
							
							setTimeout(()=>{
								
								renderIconSetter( object.GET.iconLib() );
								$('select[rel="iconLib"]', modal)[0]?.addEventListener(
									'change',
									(e)=>renderIconSetter(e.target.value),
									false
								);
								holder.on('click','.item-selector', function(e){
									const val = $(this).attr('value');
				
									$('.item-selector', holder).removeClass("active shadow");
									$(this).addClass("active shadow");
	
									holder.attr("attr-value", val);
	
									holder.trigger("attr-value-change", [val]);
								});
	
							},150);
						
							return holder;
						},
						onChange: function (v) {},
					},
					isField: defaults.isField,
					valuePersist: defaults.valuePersist,
				}
			];

		
			/*object.setPropriety({
				name: "iconColor",
				value: object.proprieties.iconColor
					? object.proprieties.iconColor
					: "#333",
				editable: false,
			});*/

			/*object.setPropriety({
				name: "iconClass",
				value: object.proprieties.iconClass ? object.proprieties.iconClass : "",
				editable: false,
			});*/

			//object.setPropriety();

			//object.setPropriety();
			
			if(showPosition)
				(function () {
					var faSetter = () => $(".gen-fa-setter");
					var btnClssSetter = () => $('.propriety-setter[rel="class"]');
					var btnStyleSetter = () => $('.propriety-setter[rel="btnStyle"]');
					var labelSetter = () => $('.propriety-setter[rel="label"]');
					var iconLibSetter = () => $('.propriety-setter[rel="iconLib"]');
					//var set
					groupProps.push({
						name: "iconPosition",
						label: "Posição do Icon",
						value: {
							value: object.proprieties.iconPosition
								? object.proprieties.iconPosition
								: (defaults.iconPosition || "left"),
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
										}">${label}</span>
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

							var toggleIconPosition = ()=>{
								const lib = iconLibSetter().val();
								$('[rel="iconPosition"]', v.modal).hide();
								if(lib)
									$('[rel="iconPosition"]', v.modal).show();
							}

							btnClssSetter().on("change", setBtnClss);

							btnStyleSetter().on("change", setBtnClss);

							iconLibSetter().on('change', toggleIconPosition);

							/*labelSetter().on("blur", () => {
								$(".btn-text", v.input).each((i, t) => {
									$(t).text(labelSetter().val() || $(t).attr("text"));
								});
							});*/

							faSetter().on("attr-value-change", (e, icon) => {
								$(".icon-position-prop", v.input)
									.find("i")
									.attr("class", `label-icon fa ${icon}`);
							});

							toggleIconPosition();

							
						},
					});
					//object.setPropriety();
				})();

			object.setPropertyGroup({
				name:'icon-props',
				label : 'Definições de Ícone',
				order:1,
				properties : groupProps
			})
  });

})();
