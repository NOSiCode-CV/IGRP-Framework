(function () {
	let com;
	$.IGRP.component('tm',{// tm = tree menu
		toolTip   : function(){
			$('body').tooltip({
				selector: '[data-toggle="tooltip"]'
			});
		},
		transform : function(p){
			let parent = p.holder,
				xslParams = {},
				name = parent.attr('name'),
				gentype = parent.attr('gentype') ? parent.attr('gentype') : 'plsql',
				separator = gentype === 'java' ? '/' : '.',
				pkg = parent.attr('package-db') ? parent.attr('package-db') : null,
				app = parent.attr('app') ? parent.attr('app') : '',
				url = pkg ? app + separator + pkg + separator + 'remote_' + name : $.IGRP.utils.getPageUrl(),
				params = pkg ? 'p_id=' + p.id : 'p_remote_tmid=' + p.id + '&p_remote_tm=' + name,
				parser = parent.attr('parser') && parent.attr('parser') === 'true' ? 'true' : 'false';

			xslParams.name 				= name;
			xslParams.target  			= parent.attr('target');
			xslParams.target_fields  	= parent.attr('target_fields');
			xslParams.parser  			= parser;

			if (parent.attr('tooltip') && parent.attr('tooltip') !== undefined)
				xslParams.tooltip = parent.attr('tooltip');

			if (p.id !== '')
				xslParams.id 	= p.id;

			if (p.class)
				xslParams.class = p.class;

			const active = $.IGRP.store.get(name + '_active') || $('#p_fwl_' + name + '_tmid').val() * 1;

			if (active)
				params += '&p_active='+active;

			/*if(parser){
				var lookup = $('.lookup-parser:first',parent);
				if(lookup[0]){*/

			const jsonLookup = $('#jsonLookup');

			if(jsonLookup[0])
				params += '&jsonLookup='+jsonLookup.val();
			/*}
         }*/

			params += '&dad='+$('body').attr('app');

			if(p.id){
				const a = $('li#' + p.id + ' .nav-header a', parent);

				if(a[0] && a.attr('ctx_param_count')){
					const cont = a.attr('ctx_param_count') * 1;

					for (let i = 1; i <= cont; i++) {
						params += '&'+a.attr('ctx_p'+i);
					}
				}
			}

			$.ajax({
				url : $.IGRP.utils.getUrl(url)+params+'&ir_cf=xml&target=_blank',
				dataType:'xml',
				headers : {
					'X-IGRP-REMOTE' : 1
				},
				error : function(e,status,ex){
					p.error();
					$.IGRP.notify({
						message : ex,
						type	: 'danger'
					});
				},
				success: function (data) {
					const xmlData = data; // já é XMLDocument porque dataType:'xml'
					const xmlPath = pkg ? 'table' : 'rows content ' + name;

					let doc = xmlData;

					// (opcional) se por algum motivo vier string, então parse:
					if (typeof doc === 'string') doc = $.parseXML(doc);

					// ⚠️ evita getXMLDocument() se não for necessário (ver ponto 2)
					const node = $(doc).find(xmlPath).get(0);

					// Se quiseres passar um documento “com raiz”:
					let xmlForTransform = doc;
					if (node) {
						xmlForTransform = document.implementation.createDocument('', '', null);
						xmlForTransform.appendChild(xmlForTransform.importNode(node, true));
					}

					if (p.id === '')
						xslParams.id = $(doc).find('table value row ' + name + '_parent').eq(0).text();

					p.transform.XMLTransform({
						xml      : xmlForTransform,
						xsl 	  : path+'/xsl/tmpl/IGRP-treemenu-remote.tmpl.xsl',
						xslPath   : '/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-treemenu-remote.tmpl.xsl',
						xslParams: xslParams,
						complete : p.complete,
						error    : p.error
					});
				}			}).always(function(_, status){
				if (status !== 'success') p.error();
			});

		},
		onLoad : function(){
			$('.box-tm[data-toggle="remote"][onload="true"]').each(function(){
				const holder = $(this),
					name = holder.attr('name'),
					onComplete = function () {
						$.IGRP.utils.loading.hide(holder);
						const active = $.IGRP.store.get(name + '_active') || $('#p_fwl_' + name + '_tmid').val() * 1;
						if (active) {
							$('ul.tree li', holder).removeClass('active');
							$('li#' + active, holder).addClass('active');
							$.IGRP.store.unset(name + '_active');
						}
						com.toolTip();
					},
					onError = function () {
						$.IGRP.utils.loading.hide(holder);
					};

				$.IGRP.utils.loading.show(holder);

				com.transform({
					holder  	: holder,
					id 			: '',
					transform 	: holder,
					complete 	: onComplete,
					error  		: onError,
					class   	: 'holder'
				});
			});
		},
		toggle: {
			remote : function(f){
				const id = f.attr('rel');

				if (!f.hasClass('set')) {
					f.addClass('load');
					com.transform({
						holder  	: f.parents('.box-tm'),
						id  		: id.split('-')[1],
						transform 	: $('#'+id),
						class   	: 'tree',
						complete 	: function(){
							f.addClass('set').removeClass('load');
							com.toggle.live(f);
							com.toolTip();
						},
						error  		: function(){
							f.removeClass('load').removeAttr('type');
						}
					});
				} else
					com.toggle.live(f);
			},
			live : function(f){
				const rel = f.attr('rel');
				com.toggle.isActive(f);
				com.toggle.isActive($('#'+f.attr('rel')));

				$('#'+rel).children('ul.tree[rel="'+rel+'"]').toggle(300);
			},
			isActive : function(f){
				f.attr('type') == 'active' ? f.removeAttr('type') : f.attr('type','active');
			}
		},
		init:function(){
			com = this;
			com.toolTip();
			com.onLoad();

			$('body').on('click','.tree-toggler .icon',function(){
				const toggle = $(this).parents('.box-tm:first').attr('data-toggle');
				com.toggle[toggle]($(this).parents('.tree-toggler:first'));
			});

			$('.box-tm').on('click','a[tree-target]',function(e){
				e.preventDefault();

				const target = $(this).attr('tree-target'),
					id = $(this).parents('li:first').attr('id'),
					holderName = $(this).parents('.box-tm:first').attr('name'),
					name = 'p_fwl_' + holderName + '_tmid',
					itarget = $.IGRP.targets[target] || $.IGRP.targets._self;

				$.IGRP.store.set({
					name : holderName+'_active',
					value: id
				});

				if($('input[name="'+name+'"]')[0])
					$('input[name="'+name+'"]').val(id);
				else
					$.IGRP.utils.createHidden({name : name, value : id, class : 'submittable'});

				itarget.action({

					url 	: $(this).attr('href'),
					target 	: target,
					clicked : $(this)

				});
			});
		}
	},true);
})();