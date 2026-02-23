(function($){
	if($ && $.IGRP){

		$.IGRP.utils = {
				
			unique : function(){

				function s4() {
				
				    return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);

				}

				return s4() + '_' + s4();

			},

			url : {

				isUrl : function(url){
					const pattern = new RegExp('^(https?:\\/\\/)?' + // protocol
						'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|' + // domain name
						'((\\d{1,3}\\.){3}\\d{1,3}))' + // OR ip (v4) address
						'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
						'(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
						'(\\#[-a-z\\d_]*)?$', 'i'); // fragment locator

					return pattern.test(url);
				},

				getParams : function (url) {

					let queryString = url ? url.split('?')[1] : window.location.search.slice(1);
					obj 				= {};
				  		
				  if (queryString) {

				    queryString = queryString.split('#')[0];

					  const arr = queryString.split('&');

					  for (let i=0; i<arr.length; i++) {
						const a = arr[i].split('=');

						const paramNum = undefined;
						let paramName = a[0].replace(/\[\d*\]/, function (v) {
							paramNum = v.slice(1, -1);
							return '';
						});

						let paramValue = typeof (a[1]) === undefined ? '' : a[1];

						paramName 	= paramName   ? paramName.toLowerCase()  : '';
				      paramValue 	= paramValue  ? paramValue.toLowerCase() : '';

				      if (obj[paramName]) {
				        if (typeof obj[paramName] === 'string') {
				          obj[paramName] = [obj[paramName]];
				        }
				        if (typeof paramNum === undefined) {
				          obj[paramName].push(paramValue);
				        }
				        else {
				          obj[paramName][paramNum] = paramValue;
				        }
				      }
				      else {
				        obj[paramName] = paramValue;
				      }
				    }
				  }

				  return obj;
				},

				getParam : function(name,url){

					const all = $.IGRP.utils.url.getParams(url);

					return all[name.toLowerCase()] || null;

				},
				getHostName : function (url) {
					const a = document.createElement('a');
					a.href = url;
					return a.hostname;
				}

			},
			openWin:function(p){

				const width = p.width ? p.width : 980;
				const height = p.height ? p.height : 520;

				const left = parseInt((screen.availWidth / 2) - (width / 2));
				const top = parseInt((screen.availHeight / 2) - (height / 2));

				const windowFeatures = "scrollbars, width=" + width + ",height=" + height +
					",status,resizable,left=" + left + ",top=" + top +
					",screenX=" + left + ",screenY=" + top;

				const myWindow = window.open(p.url, p.win, windowFeatures);
				myWindow.focus();
				return myWindow;
			},
			openChartURL : function(pObj){
				if (pObj.pUrl != null && pObj.pUrl != '') {

					const vParam = 'p_x=' + pObj.pX + '&p_y=' + pObj.pY + '&p_z=' + pObj.pZ;

					$.IGRP.utils.openWin({
						url    :$.IGRP.utils.getUrl(pObj.pUrl)+vParam,
						width  :980,
						height :520,
						win    :"IGRP_win"+(new Date()).getTime()
					});

					return false;
				}
			},
			toolTip   : function(){
				if($.fn.tooltip){
					$('body').tooltip({
						selector: '[data-toggle="tooltip"]'
					});
				}
			},
			getForm:function(){
				return $('form.IGRP-form');
			},
			getFieldsValidate:function(f){
				const form = f && f[0] ? f : $.IGRP.utils.getForm();
				const fields = $(':input[name!=""]', form).not('.no-validation, .no-required-validation, .no-validation-required, .not-form').not('.IGRP_checkall');

				return fields;
			},
			getUrl:function(url){
				url = url && url != undefined ? url : 'XXX';
				return (url.indexOf("?")==-1)?url+="?":url+="&";
			},
			getPageUrl : function(){
				return $("input[name='p_env_frm_url']").val() || window.location.href;
			},
			getFormUrl:function(url){
				const param = $.IGRP.utils.getForm().find('*').not(".notForm, #p_env_frm_url").serialize();
				return $.IGRP.utils.getUrl(url)+param;
			},
			getParam:function(pLink, pName){
				const vNewLink = pLink.substring(pLink.indexOf("?") + 1);
				const vOp = vNewLink.split("&");
				for(let i= 0; i < vOp.length; i++){
					const vNop = vOp[i].split("=");
					if(vNop[0].toLowerCase()==pName.toLowerCase()){
						return vNop[1];
					}
				}
				return null;
			},
			resetFieldsSelector : function(o){
				o.each(function(i,e){

					const parents = $(e).parents('.form-group'),

						type = $(e).parents('[item-type]').first().attr('item-type');

					switch(type){
                    
                        case'radio':
                        case 'checkbox':
                            $(e).prop("checked", false);
                        break;

                        case 'select' :
                        	
                        	if( $(e).is('.select2')){

                        		if(!$(e).data('select2'))

                        			$.IGRP.components['select2'].init( parents );

                        		$(e).select2("val", "");
                            } else {
                                $(e).val('');
                        	}
                        	
                        break;

                        case 'textarea' :
                            $(e).val('');
                        break;

						case 'texteditor':
                            CKEDITOR?.instances[$(e).attr('id')]?.setData('');
                            break;

                        case 'file':
                            $(e).val('');
                            parents.find('.form-hidden').val('');
						break;

                        case 'link':
                            $(e).parents('[item-type]').find('a').attr('href', '#').find('span').text('');
                            break;

                        default:

                            $(e).val('');
                            $(e).text('').attr('value','');
                    }

                    // Clear hidden inputs within the same form group
                    parents.find('input[type="hidden"]').each(function() {
                        $(this).val('');
                    });
                });

                return o;
			},
			resetFields  : function(o){
				
				$.IGRP.utils.resetFieldsSelector($(":input",o));
			},
			setFieldValue:function(p){

				let lookup = null,
					label = null,
					isremote = null,
					tag = p.tag,
					value = p.value;

				if (typeof $(tag) === 'object'){
					
					lookup  	= $(tag).attr('lookup') ? $(tag).attr('lookup') : null;

					label   	= $(tag).attr('label') ? $(tag).attr('label') : null;
					
					isremote   	= $(tag).attr('isremote') ? $(tag).attr('isremote') : null;
					
					value   	= $(tag).text();

					tag 		= tag.tagName.toLowerCase();
					
				}

				let formElement = p.row ? $('[name="p_' + tag + '_fk"]', p.row) : $('[name="p_' + tag + '"]');

				if(!formElement[0])
					formElement = $('[name="p_'+tag+'"]');

				let parent = $(formElement.parents('[item-name]')[0]);

				parent 	    = parent[0] ? parent : $('*[item-name="'+tag+'"]');
				
				if( parent[0] ){

					const type = parent.attr('item-type');

					if (label)
						$('label',parent).html(label);
					
					switch(type){

						case 'select':

							if(formElement.is('[multiple]'))

								value = value.split('|');
							
								if(isremote){
							
									if(!$('option',formElement)[0]){

										let options;

										if(Array.isArray(value)){
											
											value.forEach(function(xv){
												
												options.push({
													text: '',
													value: xv,
													selected: true
												});
												
											});
											
										}else{
											
											options = [{
												text: '',
												value: value,
												selected: true
											}];
										}
												
										$.IGRP.components.select2.setOptions({
											select: formElement,
											options: options
										});
									}
								}

							formElement.val(value);

						break;

						case 'checkboxlist':

							const vArr = value.split('|');

							vArr.forEach(function(v){

								formElement.filter('[value="'+v+'"]').prop('checked',true);

							});

						break;

						case 'radiolist':

							formElement.filter('[value="'+value+'"]').prop('checked',true);

						break;

						case 'checkbox':
						case 'radio':

							const checked = value == 1;

							formElement.prop('checked', checked)

						break;
							
						case 'textarea':
							
							formElement.text(value).val(value);
							
						break;
						
						case 'plaintext':
							
							if($('div[item-name="'+tag+'"]')[0])
								$('div[item-name="'+tag+'"]').html($.IGRP.utils.htmlDecode(value));
							else
								formElement.text(value);
							
						break;
						
						case 'link':
							
							$('a',parent).attr('href',value);
						
						break;

						case 'images':
							if(value)
								formElement.attr('src',value);
						
						break;

						default:
							if (lookup)
								$('.IGRP_lookupPopup',parent).attr('href',lookup);

							formElement.val(value);
					}

					formElement.trigger('change');

				}
			},
			clearSubmittables:function(){
				$('.submittable').removeClass('submittable');
			},
			getSubmitParams:function(url,form,scrollTo){
				let vUrl = url,
					vForm = $.IGRP.utils.getForm(),
					vHref = "",
					vNewUrl = "";

				if(form && form != null)
					vForm = form;

				vHref 	= vUrl.substring(0,vUrl.indexOf("#"))?vUrl.substring(0,vUrl.indexOf("#")):vUrl;
				vNewUrl = vHref.substring(0,vHref.indexOf("?"))?vHref.substring(0,vHref.indexOf("?")):vHref;

				if(vHref.indexOf("?")>-1)
				{
					const vParam = vHref.substring(vHref.indexOf("?") + 1);

					const vP = vParam.split("&");

					for(let i=0; i<vP.length; i++)
					{
						const vP1 = vP[i].split("=");

						if(vP1[0].toLowerCase()!= "p_env_frm_url" && vP1[0].toLowerCase()!= 'r'){
							if(!$("input[name='"+vP1[0]+"']",vForm)[0]){
								$.IGRP.utils.createHidden({
									name:vP1[0],
									value:vP1[1],
									class:'submittable igrpurlparam'
								});
							}
						}
					}
				}
				else
					vUrl = vHref;

				//Comentado em 23-01-2012 problemas em RELOAD
				vUrl = vHref;
				if(scrollTo){
					const vIchange = scrollTo.replace("#id", "");
					vUrl = $.IGRP.utils.getUrl(vUrl);
					vUrl+="ichange="+vIchange+scrollTo;
					if(!vForm.find("input[name='ichange']")[0])
						$.IGRP.utils.createHidden({name:'ichange',value:vIchange});
					else
	  					$('input[name="ichange"]',form).val(vIchange);
				}
			
				return vUrl;
			},
			
			adjustableRows : function(){

				const rows = $('.row.adjustable-row, .row.adjust-cols');

				rows.each(function(i, row){

					const cols = $('>.gen-column', row);

					cols.each(function(x, col){

						const contents = $('>.gen-inner>*', col);

						if(!contents[0])
							
							$(col).hide();
						
						else
							
							$(col).addClass('readjust');
						
					});

					const rowsToAdjust = $('.readjust', row),

						totalToAdjust = rowsToAdjust.length,

						division = 12 / totalToAdjust;

					if(Number.isInteger( division ) && division <= 12){
						
						rowsToAdjust.alterClass('col-sm-*');
						
						rowsToAdjust.addClass('col-sm-'+division);
						
					}
				
					
				});
				
				
			},
			
			refreshComponents : function(options){
				
				options = options || {};
				
				if(options.wrapper){
					
					/* select2 */
					
					if(options.wrapper.find('.form-control.select2'))
						
						$.IGRP.components.select2.init( options.wrapper );
					
					/*table ( data table, formlist )*/

					const table = options.wrapper.find('table').first();

					if(table.hasClass('igrp-data-table'))
						
						$.IGRP.components.tableCtrl.dataTable({
							parent : options.wrapper
						})
						
					if(table.hasClass('IGRP_formlist'))
						
						table.IGRP_formlist();

					if($.IGRP.components.contextMenu)
						
						$.IGRP.components.contextMenu.set( $('.gen-container-item[item-name="'+options.itemName+'"]') );
					
				}
				
			},
			
			sanitize:function(pOp){
				let vTexto = pOp;
				try{
					vTexto = vTexto.replace('\'','&#92;');
					return(vTexto);
				}catch(e){return vTexto;}
			},
			createHidden:function(p){
				const form = $.IGRP.utils.getForm();
				const clss = p.class || '';
				const id = p.id || '';

				if(p.name){
					if ($('input[name="'+p.name+'"]')[0]) 
						$('input[name="'+p.name+'"]').addClass(clss).val(p.value);
					else if(id)
						form.prepend('<input id="'+id+'" type="hidden" class="'+clss+'" name="'+p.name+'" value="'+p.value+'"/>');
					else form.prepend('<input type="hidden" class="'+clss+'" name="'+p.name+'" value="'+p.value+'"/>');
				}
			},
			htmlEncode:function(str){
				return str?$('<div />').text(str).html():"";
			},
			htmlDecode:function(str){
				return str?$('<div />').html(str).text():"";
			},
			minify : function (str) {
				return str.replace(/^\s+|\r\n|\n|\r|(>)\s+(<)|\s+$/gm, '$1$2');
			},
			isNotNaN : function(v){
				return isNaN(v)? 0:v*1;
			},
			
			getType: function (f) {
				const type = f.attr('type') ? f.attr('type') : f.prop('tagName');

				return type ? type.toLowerCase() : '';
			},
			
			arrRemoveItem : function(arr,v){
                return $.grep(arr, function(val) {
				  return val != v;
				});
			},
			rounding : {

				mask : function (x) {
					x = x ? x.toString() : '';
					x = x.indexOf('.') != -1 ? x.replace('.', ',') : x;
					return x ? x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") : 0;
				},

				fixedTo : function (v, f) {
					return v.toFixed(f ? f : 2);
				},

				roundTo : function (v, d) {
					d = d ? d : 1;
					return Number(Math.round(v + 'e' + d) + 'e-' + d);
				},

				round : function (v) {
					return Math.round(v);
				},

				ceil : function (v) {
					return Math.ceil(v);
				},

				ceilTo : function (v, d) {
					d = d ? d : 1;
					return Number(Math.ceil(v + 'e' + d) + 'e-' + d);
				},

				floor : function (v) {
					return Math.floor(v);
				},

				abs : function (v) {
					return Math.abs(v);
				}
			},

			numberFormat : function(p){

				let val = p.val;

				try {
					
					if(p.obj && p.obj.is('[numberformat]')){
						
						p.obj.attr('numberformat').split(',').forEach(function (fr) {

							let round = null,
								auxfr = null;

							if (fr.indexOf(':') !== -1) {
								fr = fr.split(':');

								if (!isNaN(fr[1])) {
									round = fr[1] * 1;
									auxfr = fr[0] + 'To';

								} else
									auxfr = fr[0];
							}else
								auxfr = fr;
							
							val = $.IGRP.utils.rounding[auxfr](p.val, round);
							
						});

						return val;
					}	
				} catch (error) {
					console.log('numberFormat', error);
				}

				return val;
			},

			extractFieldName : function(p){

				const starStr = p.star || '{',

					endStr = p.end || '}',

					holder = p.holder || $.IGRP.utils.getForm(),

					arrStar = $.IGRP.utils.string.getIndices(starStr, p.str),

					arrEnd = $.IGRP.utils.string.getIndices(endStr, p.str),

					arrObj = {},

					prefix = p.isTable ? '_fk' : '';

				arrStar.forEach(function (idx, i) {

					const xpr = p.str.substring(idx, arrEnd[i] + endStr.length),

						auxName = 'p_' + xpr.slice(starStr.length, xpr.indexOf(endStr));
					let name = auxName + prefix,

						field = $('[name="' + name + '"]', holder);

					if(!field[0]){
						field 	= $('[name="' + auxName + '"]', $.IGRP.utils.getForm());
						name 	= auxName;
					}

					arrObj[name] = {
						str 	: xpr,
						field	: field
					};

				});

				return arrObj;
			},

			runMathcal: function (p) {

				try {

					let str = p.fx;

					for (let f in p.extract) {

						var extract = p.extract[f],
							val 	= extract.field.val();

						if ($.IGRP.utils.getType(extract.field) == 'date')
							val = new Date(val).getTime();

						val = $.isNumeric(val) ? Number(val) : "'"+val+"'";

						str = str.replaceAll(extract.str, val);
					}

					str = str.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&amp;', '&');

					var val = eval(str);

					p.val = val;

					val = $.IGRP.utils.numberFormat({
						obj : p.field,
						val : val
					});

					p.formatVal = val;

					if (p.isTable)
						$('[name="' + p.field.attr('name') + '_desc"]', p.holder).val(val);

					p.field.val(val).trigger('change').trigger('calculation-result', [p]);

					$(document).trigger('field:calculation', [p]);

				} catch (error) {
					console.log('runMathcal', error);
				}
			},

			mathcal: function (obj) {

				obj = $(obj)[0] ? obj : $('body');

				$('*[mathcal]', obj).each(function () {

					const _this = $(this),

						fx = $.IGRP.utils.minify(_this.attr('mathcal')),

						isTable = _this.parents('table')[0] ? true : false,

						holder = isTable ? _this.parents('tr:first') : $.IGRP.utils.getForm(),

						extract = $.IGRP.utils.extractFieldName({
							str: fx,
							holder: holder,
							isTable: isTable
						});

					if ($.isPlainObject(extract)){

						for (let f in extract) {
							
							$(document).trigger('document:mathcal', [{
								name 	: f,
								fx 		: fx,
								holder 	: holder,
								field 	: _this,
								isTable : isTable,
								extract : extract
							}]);
						}
					}
				});
			},

		afterSubmitAjax : function (p) {
            var xml = p.xml,
                hasRefreshAttr = p.clicked[0].hasAttribute("refresh-components"),
                refresh_components = hasRefreshAttr ? p.clicked.attr("refresh-components") : null,
                nodes = hasRefreshAttr && refresh_components != '' ? refresh_components.split(',') : [];

            if (!hasRefreshAttr) {
                $('.table, .IGRP-highcharts', p.sform).each(function(id, el) {
                    nodes.push($(el).parents('.gen-container-item').attr('item-name'));
                });
            }

            if (!nodes[0]) {
                p.clicked.removeAttr("disabled");
                $.IGRP.events.execute('submit-complete', p);
                return;
            }

            // ── Try XSL path first (original behaviour) ───────────────────────
            var xslURL = $.IGRP.utils.getXMLStylesheet(xml);

            if (xslURL) {
                $.IGRP.utils.xsl.transform({
                    xsl     : xslURL,
                    xml     : xml,
                    nodes   : nodes,
                    clicked : p.clicked,
                    complete: function(res) {
                        $.IGRP.events.execute('submit-complete', p);
                        p.clicked.removeAttr("disabled");
                    }
                });
                $.IGRP.utils.message.handleXML(xml);
                return;
            }

            // ── Fallback: server returned HTML (server-side XSLT transform) ───
            // Re-request each node via transformXMLNodes using the same URL
            var actionUrl = p.sform.attr('action') || $.IGRP.utils.getPageUrl();

            $.IGRP.utils.transformXMLNodes({
                nodes   : nodes,
                url     : actionUrl,
                data    : p.sform.find('*').not('.notForm').serialize(),
                headers : { 'X-IGRP-REMOTE': 1 },
                success : function(c) {
					if ($.IGRP.components.tableCtrl && $.IGRP.components.tableCtrl.resetTableConfigurations)
                        $.IGRP.components.tableCtrl.resetTableConfigurations(c.itemHTML);
                },
                error   : function() {
                    console.warn('[afterSubmitAjax] transformXMLNodes fallback failed');
                }
            });

            $.IGRP.utils.message.handleXML(xml);
            $.IGRP.events.execute('submit-complete', p);
            p.clicked.removeAttr("disabled");
        },

			file2base64 : function(p){

				const fileB64 = new FileReader();

				fileB64.readAsDataURL(p.field[0].files[0]);

				fileB64.onload = function () {

					const result = fileB64.result;

					$('[src]',p.target).attr('src',result);

					$(document).trigger('document:file2base64',[{
						field  : p.field,
						target : p.target,
						result : result
					}]);

					$.IGRP.utils.loading.hide(p.target);
				};

				fileB64.onerror = function (error) {
					$.IGRP.utils.loading.hide(p.target);
				    console.log('Error: ', error);
				};
			},
			str2base64 : function(str){
				return window.btoa(encodeURIComponent(str));
			},
			base64toBlob : function(p) {
				const sliceSize = p.sliceSize || 512,
					base64 = p.base64Data.split(';'),
					byteCharacters = atob(base64[1].split(",")[1]),
					contentType = base64[0].split(":")[1] || p.contentType;
				byteArrays 		= [];

		        for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
					const slice = byteCharacters.slice(offset, offset + sliceSize);

					const byteNumbers = new Array(slice.length);
					for (let i = 0; i < slice.length; i++) {
		                byteNumbers[i] = slice.charCodeAt(i);
		            }

					const byteArray = new Uint8Array(byteNumbers);

					byteArrays.push(byteArray);
		        }

		      	return new Blob(byteArrays, {type: contentType});
			},
			verticalCentralize:function(s){
				const selector = s || '[vertical-centralize="true"]';

				$(selector).each(function(i,el){
					
					console.log(el);

				})
			},
			arrayValuesToString : function(arr,spliter){
				let str = "";
				if(arr){
					arr.forEach(function(a,i){
						str+=a;
						if(i != arr.length-1)
							str+=spliter;
					});
				}
				return str;
			},
			ffoxDisableOutputEscaping: function(){

				const doe = $('.disable-output-escaping, .ff-fix').not('.set');

				if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
					doe.each(function(i,d){
						$(d).html( $(d).text() );
					});
				}

				doe.addClass('set');

			},
			message : {
				getIcon : {
					'danger' : 'exclamation-circle',
					'warning': 'exclamation-triangle',
					'success': 'check-circle',
					'info' 	 : 'info-circle'
				},
				alert : function(p){
					const type = p.type.toLowerCase() || 'info',
						icon = $.IGRP.utils.message.getIcon[type];

					return '<div class="dynamic-alert alert alert-'+type+'" role="alert">'+
						'<i class="fa fa-'+icon+' igrp-msg-icon"></i>'+
						'<a class="close" data-dismiss="alert" aria-label="Close">'+
						'<span aria-hidden="true"><i class="fa fa-times"></i></span>'+
						'</a>'+$.IGRP.utils.htmlDecode(p.text)+'</div>';
				},
				handleXML : function(xml){

					try{

						let alert = '',

							debug = '';

						$.each($(xml).find('messages message'),function(i,row){

							let type = $(row).attr('type');

							if (type != 'debug' && type != 'confirm') {

								type = type == 'error' ? 'danger' : type;

								alert += $.IGRP.utils.message.alert({
									type : type,
									text : $(row).text()
								});

							}else if(type == 'debug'){
								debug += '<li value="'+$(row).text()+'">'+
									$.IGRP.utils.htmlDecode($(row).text())+
								'</li>';
							}
						});
						
						
						if(alert != '')
							$('.igrp-msg-wrapper').html(alert);
						
						if(debug != '')
							$('#igrp-debugger .igrp-debug-list').html(debug);

					}catch(err){
						
						console.log(err)
					}

				},
				notify : function(xml, data){
					
					$.each($(xml).find('messages message'),function(it,row){

						let type = $(row).attr('type');

						if (type != 'debug' && type != 'confirm') {

							const text = $(row).text();

							type = type == 'error' ? 'danger' : type;
							
							$.IGRP.notify({
								message : text,
								type	: type
							});
							
							if(data){
								
								data.item.trigger('igrp-notify', [ {
									
									type : type,
									
									text : text
									
								} ]);
							}
						}
					});
				}

			},
			loading : {
				show : function(o){

					const obj = o ? o : $('body');

					$.IGRP.utils.loading.hide(obj);

					obj.addClass('loading').append('<div class="loader"/>');
				},
				hide : function(o){

					const obj = o ? o : $('body');

					if($('.loader',obj)[0]) {

						obj.removeClass('loading');

						$('.loader',obj).remove();
					}

				}
			},
			string:{
				
				getIndices : function(searchStr, str, caseSensitive) {
					let startIndex = 0;
					const searchStrLen = searchStr.length;
					let index;
					const indices = [];

					if(str){
				    	if (!caseSensitive) {
					        str = str.toLowerCase();
					        searchStr = searchStr.toLowerCase();
					    }
					    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
					        indices.push(index);
					        startIndex = index + searchStrLen;
					    }
				    }
				    
				    return indices;
				},
				replaceSpecialChars : function(label){
					const chars = ['[', ']', '€', '«', '»', ';', '='];
					const accents = [
						{
							base: 'a',
							accents: ['\u00c4', '\u00c3', '\u00e1', '\u00e0', '\u00e2', '\u00e3', '\u00e4', '\u00c1', '\u00c0', '\u00c2']
						},
						{
							base: 'e',
							accents: ['\u00e9', '\u00e8', '\u00ea', '\u00ea', '\u00c9', '\u00c8', '\u00ca', '\u00cb']
						},
						{
							base: 'i',
							accents: ['\u00ed', '\u00ec', '\u00ee', '\u00ef', '\u00cd', '\u00cc', '\u00ce', '\u00cf']
						},
						{
							base: 'o',
							accents: ['\u00d6', '\u00d5', '\u00f3', '\u00f2', '\u00f4', '\u00f5', '\u00f6', '\u00d3', '\u00d2', '\u00d4']
						},
						{base: 'u', accents: ['\u00fa', '\u00f9', '\u00fb', '\u00fc', '\u00da', '\u00d9', '\u00db']},
						{base: 'c', accents: ['\u00e7', '\u00c7']},
						{base: 'n', accents: ['\u00f1', '\u00d1']}
					];

					//replace white spaces to _
					let str = label.replaceAll(' ', '_');
					//replace - to _
					str = str.replaceAll('-','_');
					//replace special characters
					str = str.replace(/[&\/\\#,+()$~%.'":*?<>!?@´ªº^|£§{}]/g,'');
					//replace symbols
					chars.forEach(function(c){
						str = str.replaceAll(c,'');
					});
					//replace accents
					accents.forEach(function(aObj){
						aObj.accents.forEach(function(a){
							str = str.replaceAll(a,aObj.base);
						});
					});

					return str.toLowerCase();
				}
			}
		}
		/*FILE SUBMIT*/
		/*Get Form Data as Object*/
		$.IGRP.utils.getFormData = function(p){
			const vFormData = new FormData();
			let vBlod = null,
				vType = p.pContentType ? p.pContentType : 'plain/text',
				vFormat = p.pFormat ? p.pFormat : 'txt';

			p.pArrayFiles.forEach(function(pfile){
				const vName = pfile.name;
				let vFileName = (vName.substring(0, 2) == 'p_') ? vName.substring(2) : vName;

				vFileName 	= pfile.filename ? pfile.filename : vFileName;
				vType 		= pfile.type ? pfile.type : vType,
				vFormat 	= pfile.format ? pfile.format : vFormat;
				vBlod 		= new Blob([pfile.value], {type:vType});
				vFileName 	= pfile.value ? vFileName+"."+vFormat : '';
				vFormData.append(vName, vBlod, vFileName);			
			});

			if (p.pArrayItem) {
				p.pArrayItem.forEach(function(pItem){
					vFormData.append(pItem.name,pItem.value);
				});
			}
			return vFormData;
		};
		/*Submit String as File*/
		$.IGRP.utils.submitStringAsFile = function(p){
			/*
				pParam:{
					pContentType: string ex -> 'plain/text, text/json ...' // tipe de ficheiro,
					pFormat		: string ex -> 'txt, json, xml ...' // formato de ficheiro,
					pArrayFiles : array  ex -> [{name:xxx,value:zzz}] // itens a ser submetido como ficheiro
					pArrayItem 	: array  ex -> [{name:xxx,value:zzz}] // outros itens e ser submetido mas não como ficheiro
				},
				pUrl : url ex ->  https://www.xxxx.com // url de POST,
				pComplete : function operação finalizada devolve resposta,
				pNotify  : boolean ex -> true/false // caso pretende ou nao despoletar notificação por defeito a notificação é despoletada
			*/
			const vRequest = new XMLHttpRequest(),
				vData = $.IGRP.utils.getFormData(p.pParam);
			let typeNotify = 'danger';
			const form = $.IGRP.utils.getForm(),
				showNotify = p.pNotify === false ? false : true;
			let response = null,
				message = '';

			form.attr('accept-charset','UTF-8');
			

			//console.log(document.charset);

		    vRequest.open("POST",p.pUrl,true);
		    vRequest.timeout = 600000; // time in milliseconds

		    vRequest.setRequestHeader('Encoding','UTF-8');
			vRequest.setRequestHeader('Charset','UTF-8');
			//vRequest.setRequestHeader("Content-Type", "multipart/form-data;charset=ISO-8859-1");
			vRequest.setRequestHeader("X-Requested-With", "XMLHttpRequest");

			if(vRequest.overrideMimeType)
		    	vRequest.overrideMimeType('text/xml; charset=UTF-8');

		    vRequest.ontimeout = function (e) {
				$.IGRP.utils.loading.hide();
				$.IGRP.notify({
					message : 'Time out',
					type	: typeNotify
				});
			};

			vRequest.onprogress = function (){
				$.IGRP.utils.loading.show();
			};

		    vRequest.onreadystatechange = function(){
		    	//console.log(vRequest.getAllResponseHeaders());
		    	if(vRequest.readyState == 4){ // operação finalizada
		    		typeNotify = vRequest.status == 200 ? 'success' : 'danger';
		    		
		    		$.IGRP.utils.loading.hide();
		    		
		    		if (showNotify){
		    			if(vRequest.status == 200){
			    			try{
			    				response 	= $($.parseXML(vRequest.response)).find('messages message');
			    				typeNotify 	= response.attr('type') && response.attr('type') != undefined ? response.attr('type').toLowerCase() : typeNotify,
			    				message 	= response.text();
			    			}catch(e){
			    				response 	= $.parseJSON(vRequest.response);
			    				typeNotify 	= response.type && response.type != undefined ? response.type.toLowerCase() : typeNotify,
			    				message 	= response.messages;
			    			}
		    			}
		    			
		    			typeNotify = typeNotify === 'error' ? 'danger' : typeNotify;

		    			message = message && message != undefined ? message : 'Request info: Status '+vRequest.status+' '+vRequest.statusText; 

		    			$.IGRP.notify({
							message : $.IGRP.utils.htmlDecode(message),
							type	: typeNotify
						});
					}

		    		if(p.pComplete) 
			    		p.pComplete(vRequest);
		    	}
		    };

		    vRequest.send(vData);
		};

		

		$.IGRP.utils.submitPage2File = {
			getFiles : function(holder){
				const array = [];

				holder = holder && holder[0] ? holder : $('body');

				$('input[type="file"]', holder).each(function(){
					const files = $(this)[0].files,
						obj = {};

					obj.name 	 = $(this).attr('name');
					obj.type 	 = 'application/octet-stream';
					obj.format 	 = '';
					obj.filename = $(this).attr('name')

					if(files.length > 0){
						const name = files[0].name.split('.');

						obj.value 	  = files[0];
						obj.type  	  = files[0].type;
						obj.format    = name[1];
						obj.filename  = name[0];
					}else
						obj.value = '';
					
					array.push(obj);
				});
				return array;
			},
			json2xml : function(obj){
				let toXml = function (v, name, ind) {
					let m;
					let xml = "";
					if (typeof (v) == "object") {
						let hasChild = false;
						for (m in v) {
							if (m.charAt(0) === "@") {
								xml += " " + m.substr(1) + "=\"" + v[m].toString() + "\"";
							} else {
								hasChild = true;
							}
						}
						if (hasChild) {
							for (m in v) {
								if (m === "name") {
									xml += "<" + v[m] + ">" + $.IGRP.utils.htmlEncode(v['value']) + "</" + v[m] + ">";
								}
							}
						}
					}
					return xml;
				}, xml = "";
				for (const m in obj) {
			    	xml += toXml(obj[m], m, "");
			  	}
			  	return '<row>'+xml+'</row>';
			},
			creatFiles2Submit : function(p){
				const obj = [];
				let xml = p.serialize.find('*').not(p.notSerialize).not('[name="p_env_frm_url"]').serializeArray();

				xml = '<?xml version="1.0" encoding="UTF-8"?><content>'+
					$.IGRP.utils.submitPage2File.json2xml(xml)+'</content>';

				obj.push({name:p.fileName,value:xml});

				//add files 
				const files = $.IGRP.utils.submitPage2File.getFiles();
				if (files) {
					files.forEach(function(e,i){
						obj.push(e);
					});
				}

				return obj;
			},
			getUrlParam : function(url){
				const array = [];
				try{
					if(url.indexOf("?")>-1){
						const param = url.substring(url.indexOf("?") + 1);
						const p = param.split("&");
						for(let i = 0; i < p.length; i++){
							const p1 = p[i].split("=");
							if(p1[0].toLowerCase() !== "p_env_frm_url"){
								if(!$("input[name='"+p1[0]+"']")[0])
									array.push({name:p1[0],value:p1[1]});
							}
						}
					}
				}catch(e){null;}

				return array;
			},
			onSubmit : function(p){
				const files = $.IGRP.utils.submitPage2File.creatFiles2Submit({
						serialize: p.serialize,
						notSerialize: p.notSerialize,
						fileName: p.fileName || 'p_igrpfile'
					}),
					getParam = {
						pContentType: p.contentType || 'plain/xml',
						pFormat: p.format || 'xml',
						pArrayFiles: files,
						pArrayItem: $.IGRP.utils.submitPage2File.getUrlParam(p.url)
					};

				$.IGRP.utils.submitStringAsFile({
					pParam 		: getParam,
					pUrl   		: p.url,
					pComplete 	: p.complete,
					pNotify   	: p.notify
				});
			}
		};
		$.IGRP.utils.xsl = {
				
			files : {
				
				
				
			},

			getStyleSheet : function(nodes,includes){
				const xsl = $.parseXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">' +
					'<xsl:output method="html" encoding="utf-8"/>' +
					'<xsl:template match="/"></xsl:template>' +
					'</xsl:stylesheet>');
				let template;

				const stylesheet = $(xsl).find('>:first-child');

				$.each( $('>*',stylesheet),function(i,n){

					if(n.nodeName == 'xsl:template')
						template = $(n);
				});
	
				template.append(nodes);

				stylesheet.append(includes);

				return xsl;
			},

			getIncludeNodes : function(xsl){
				const arr = [];
				const d = $(xsl.documentElement);
				$.each(d.find('>*'),function(){
					if(this.nodeName == 'xsl:include')
						arr.push(this);
				});

				return arr;
				//$.each(  )
			},

			getNode : function(xsl,name,attrs){
				const arr = [];
				const d = $(xsl.documentElement);

				$.each( d.find('html body *'),function(){
					if(this.nodeName == name){
						const node = this;
						if(attrs){
							for(let a in attrs){
								if(node.getAttribute(a) == attrs[a])
									arr.push(node);
							}
						}
					}
				});

				return arr;
			},
			
			transform : function(p){
				
				$.ajax({

					url : p.xsl,

					success:function(pageXSL){

						const nodesArr = [];

						const includesArr = $.IGRP.utils.xsl.getIncludeNodes(pageXSL);

						//get template includes
						$.each(includesArr,function(x,i){

							const href = $(i).attr('href');

							$(i).attr('href',href.split('../../xsl/tmpl/').pop(''));

						});

						//get nodes xsl
						if(p.nodes){

							let id = 0;

							const count = 0;

							p.nodes.forEach(function(n,i){

								const nodeElement = $.IGRP.utils.xsl.getNode(pageXSL, 'xsl:if', {

									test: 'rows/content/' + n

								})[0];

								const xslt = $.IGRP.utils.xsl.getStyleSheet(nodeElement, includesArr);

								const itemHTML = $('.gen-container-item[item-name="' + n + '"]');

								const oldStyle = itemHTML.attr('style') || '';

								$.IGRP.events.execute('before-element-transform',{
									//content  : content,
									itemName : n,
									xml 	 : p.xml,
									xsl      : xslt,
									index    : id
								});

								itemHTML.XMLTransform({
									xml     	 : p.xml,
									xsl     	 : xslt,
									loading      : true,
									xslBasePath  : path+'/xsl/tmpl',
									method 	     : 'replace',
									complete     : function(e,c){

										const content = $('.gen-container-item[item-name="' + n + '"]'),

											currentStyle = content.attr('style') || '',

											style = oldStyle + currentStyle;

										content.attr('style', style);
										
										id += 1;
										
										$.IGRP.events.execute('element-transform',{
											content  : content,
											itemName : n,
											xml 	 : p.xml,
											xsl      : xslt,
											index    : id
										});

										if(p.success){
											p.success({
												itemName : n,
												xsl 	 : xslt,
												xml 	 : p.xml,
												itemHTML : content
											});
										}
										
										if(id == p.nodes.length){
											if(p.clicked)
												p.clicked.removeAttr("disabled");
											
											$.IGRP.utils.message.handleXML(p.xml);
											
											if(p.complete){
												
												p.complete();
												
											}
										}
										
										
									},
									error: function(e){
										
										$.IGRP.notify({
											message : 'Error Transforming Component',
											type    : 'warning'
										});
									}
								});
								
							});
						}
					}
				});
			}
		};

		$.IGRP.utils.getXMLStylesheet = function(d){

			let xstr;

			xstr = typeof d == 'string' ? d : new XMLSerializer().serializeToString(d);

		    if(xstr){
				const beginExp = '<?xml-stylesheet href="';

				const endExp = '" type="text/xsl"?>';

				const beginArr = $.IGRP.utils.string.getIndices(beginExp, xstr, false);
				const endArr = $.IGRP.utils.string.getIndices(endExp, xstr, false);

				if(!beginArr[0] && beginArr[0] !== 0) return null;
				if(!endArr[0] && endArr[0] !== 0) return null;

				const begin = beginArr[0] + beginExp.length;

				const end = endArr[0];

				var exprss = xstr.substring(begin,end);
		    }

			return exprss || null;
		};

		$.IGRP.utils.transformXMLNodes = function(params) {

			var options = $.extend(true, {
				nodes   : [],
				url     : null,
				headers : {},
				data    : null,
				success : null,
				error   : null
			}, params);

			$.ajax({
				url     : options.url,
				data    : options.data,
				method  : 'POST',
				headers : options.headers,
				success : function(xml, status, xhr) {

					// ── 1. Tenta sempre extrair o XSL do response (caminho original) ──
					var responseText = xhr.responseText || '';
					var xslURL       = $.IGRP.utils.getXMLStylesheet(responseText);

					if (xslURL) {
						$.IGRP.utils.xsl.transform({
							xsl    : xslURL,
							xml    : xml,
							nodes  : options.nodes,
							success: options.success,
							error  : options.error
						});
						return;
					}

					// ── 2. Fallback: servidor retornou HTML direto (sem xml-stylesheet) ──
					_applyHtmlNodes(responseText || xml, options);
				},
				error : function(xhr) {
					console.warn('[transformXMLNodes] Request failed', xhr.status, xhr.statusText);
					if (options.error) options.error({ xhr: xhr });
				}
			});
		};

		/**
		 * Aplica nós HTML diretamente no DOM, substituindo os .gen-container-item correspondentes.
		 * Usado quando o servidor retorna HTML em vez de XML+XSL.
		 *
		 * @param {string|Object} response  - responseText (string) ou objeto jQuery/XML
		 * @param {Object}        options   - opções originais de transformXMLNodes
		 */
		function _applyHtmlNodes(response, options) {

			var html = typeof response === 'string'
				? response
				: (new XMLSerializer()).serializeToString(response);

			if (!html) {
				console.warn('[transformXMLNodes] Resposta vazia, nenhum nó substituído.');
				if (options.error) options.error({ message: 'Empty response' });
				return;
			}

			var $doc = $('<div>').append($.parseHTML(html, document, true));

			options.nodes.forEach(function(nodeName) {

				var $new     = $doc.find('.gen-container-item[item-name="' + nodeName + '"]').first();
				var $current = $('.gen-container-item[item-name="' + nodeName + '"]');

				if (!$new[0]) {
					console.warn('[transformXMLNodes] Nó não encontrado na resposta:', nodeName);
					return;
				}

				// ── Destruir DataTables ANTES de remover o nó do DOM ──────────────────
				// Evita "Cannot read properties of null (reading 'parentNode')"
				// que ocorre quando destroy() é chamado após replaceWith()
				if ($.fn.DataTable) {
					$('table.igrp-data-table', $current).each(function() {
						if ($.fn.DataTable.isDataTable(this)) {
							try {
								$(this).DataTable().destroy();
							} catch(e) {
								console.warn('[transformXMLNodes] DataTable destroy failed:', e);
							}
						}
					});
				}

				// ── Substitui o nó no DOM ──────────────────────────────────────────────
				var oldStyle = $current.attr('style') || '';

				if ($current[0]) {
					$current.replaceWith($new);
				}

				if (oldStyle) {
					$new.attr('style', (oldStyle + ' ' + ($new.attr('style') || '')).trim());
				}

				// ── Reinicializa componentes IGRP no novo nó ──────────────────────────
				$.IGRP.utils.refreshComponents({
					wrapper  : $new,
					itemName : nodeName
				});

				// ── Dispara eventos (agora o nó antigo já não existe no DOM) ──────────
				$.IGRP.events.execute('element-transform', {
					content  : $new,
					itemName : nodeName
				});

				if (options.success) {
					options.success({
						itemName : nodeName,
						itemHTML : $new
					});
				}
			});
		}

		const containsFunc = function (a, i, m) {
			return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
		};

		jQuery.expr[':'].Contains = containsFunc;

        jQuery.expr[':'].contains = containsFunc;

		const init = function () {

			$.IGRP.utils.ffoxDisableOutputEscaping();

			$.IGRP.utils.verticalCentralize();

			$.IGRP.utils.adjustableRows();

			$.IGRP.utils.mathcal();

			$.IGRP.utils.toolTip();

			$.IGRP.events.on('submit-complete', function () {

				$.IGRP.utils.adjustableRows();

				$.IGRP.utils.mathcal();

			});

		};

		$.IGRP.on('init',function(){
        	init();
        });

	}else{
		console.log('jQuery or IGRP.js missing!')
	}
	
	$(document).on('document:mathcal', function (i, p) {

		$('[name="' + p.name + '"]',p.holder).on('change' ,function () {

			$.IGRP.utils.runMathcal(p);

		});
	});

}($));
