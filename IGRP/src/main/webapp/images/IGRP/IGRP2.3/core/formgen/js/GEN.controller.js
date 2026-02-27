const GENERATOR = function (genparams) {


    const getPageId = function () {
        return $('#id_objeto').val();
    };
    const setPageId = function (id) {
        $('#id_objeto').val(id);
    };
    const setPageTitle = function (title) {
        $('#gen-page-title .title').text(title);
    };
    const getXSLTop = function () {

        let content = GEN.baseXSL.top;

        let includes = "";

        includes += getObjectCssFiles(GEN.getContainersIncludes(), 'container');

        includes += getObjectCssFiles(GEN.getFieldsIncludes(), 'field');

        if (GEN.files.css[0]) {

            GEN.files.css.forEach(function (css) {

                const path = GEN.getIncludeURL(css.file);

                includes += '<link type="text/css" rel="stylesheet" href="' + path + '?v={$version}"/>';

            });

        }

        if (GEN.SETTINGS.process) {

            GEN.pfiles.css.forEach(function (css) {

                includes += '<link type="text/css" rel="stylesheet" href="' + GEN.getIncludeURL(css.file) + '.css?v={$version}"/>';

            });
        }


        includes += '<style>' + GEN.cssEditor.getValue().replace(/(\r\n|\n|\r|\t)/gm, "") + '</style>'

        const idx = content.indexOf('</head>');

        content = content.insert(idx, includes);

        return content;

    };
    const getXSLBottom = function () {

        let rtn = "";
        let includesStr = GEN.getDefaultIncludesStr(true);
        const includes = [];
        const split = GEN.baseXSL.bottom.split('<!--INCLUDES-->');
        const xslTmplPath = GEN.SETTINGS.gentype === 'java' ? '../../..' : '../..';

        const includeTmpl = function (name) {

            includes.push(name);

            includesStr += '<xsl:include href="' + xslTmplPath + '/xsl/tmpl/' + name + '?v=' + version + '"/>';

        };

        let jsIncludes = "";

        GEN.getContainers().forEach(function (c) {
            /*XSL INCLUDES*/
            if (c.getXSLIncludes) {
                c.getXSLIncludes().array.forEach(function (iName) {
                    if (includes[0]) {
                        let found = false;
                        for (let x = 0; x < includes.length; x++) {
                            if (includes[x] === iName) {
                                found = true;
                                break;
                            }
                        }
                        if (!found) includeTmpl(iName);
                    } else {
                        includeTmpl(iName);
                    }
                });
            }

        });

        if (GEN.SETTINGS.process) {

            GEN.pfiles.xsl.forEach(function (xsl) {

                includeTmpl(xsl.file + '.tmpl.xsl');

            });
        }

        //console.log(GEN.getContainersIncludes());
        //console.log(GEN.getFieldsIncludes())

        jsIncludes += getObjectJSFiles(GEN.getContainersIncludes(), 'container');

        jsIncludes += getObjectJSFiles(GEN.getFieldsIncludes(), 'field');

        if (GEN.files.js[0]) {

            GEN.files.js.forEach(function (js) {

                const path = GEN.getIncludeURL(js.file);

                jsIncludes += '<script type="text/javascript" src="' + path + '"></script>';

            });

        }

        rtn = split[0] + includesStr + split[1];

        const idx = rtn.indexOf('</body>');

        rtn = rtn.insert(idx, jsIncludes);

        //omeText.replace(/(\r\n|\n|\r)/gm,"");
        const bodyEnd = rtn.indexOf('</body>');

        if (GEN.jsEditor.getValue()) {
            const jsContent = GEN.jsEditor.getValue();

            const bytes = new TextEncoder().encode(jsContent);
            const binary = String.fromCharCode(...bytes);
            const encoded = btoa(binary);

            const loader = `var __js=document.createElement('script');__js.textContent=new TextDecoder().decode(Uint8Array.from(atob('${encoded}'),c=>c.charCodeAt(0)));document.head.appendChild(__js);`;

            rtn = rtn.insert(bodyEnd, '<script>' + loader + '<\/script>');
        }
        /*RULES SCRIPT*/
        const rulesStr = GEN.getRules();

        if (rulesStr) {


            let caller = rulesStr.caller;

            caller = GEN.escapeXSLChars(caller);

            rtn = rtn.insert(bodyEnd, '<!-- RULES --><script src="{$path}/core/igrp/IGRP.rules.class.js"></script><script>\n' + caller + '</script>');
        }


        return rtn;
    };
    const isTypeChangeble = function (type) {

        let rtn = true;

        if (type === 'button' || type === 'hidden' || type === 'map_widget')
            rtn = false;

        return rtn;

    };
    const setCustomCSStoView = function () {
        $('#custom-css').html(GEN.cssEditor.getValue())
    };
    const setJSValue = function (cb) {
        codeEditorView(true);
        if (cb) cb();
    };
    const setCustomJStoView = function () {
        const content = GEN.jsEditor.getValue();

        if (content && content.trim() !== '') {
            const decoded = content
                .replace(/&amp;/g, '&')
                .replace(/&lt;/g, '<')
                .replace(/&gt;/g, '>')
                .replace(/&quot;/g, '"')
                .replace(/&#39;/g, "'")
                .replace(/&nbsp;/g, ' ');

            try {
                new Function(decoded)();
            } catch (e) {
                console.error('Custom JS execution error:', e);
            }
        }
    };
//CSS CONTROLS
    const setCSSValue = function (cb) {

        codeEditorView(true);

        setTimeout(function () {
            if (cb) cb();
            GEN.cssEditor.refresh();
        }, 15);
    };
    const codeEditorView = function (o) {
        const operation = o ? 'addClass' : 'removeClass';

        if (o) window.scrollTo(0, 0);

        $('html')[operation]('editor-view');
    };
    const resizeCodeMirrorArea = function () {

        const h = $(window).height() - 95;

        $('.gen-viewers .cm-s-default').each(function (i, cm) {

            if ($(cm).parent().hasClass('has-error')) {

                $(cm).height(h - 160);

            } else {

                $(cm).height(h);

            }

        })

        $('.gen-editor-toolsbar').height(h);

    };
    const setVars = function () { //SET CONTAINER VARIABLES

        GEN.VIEW = $('#igrp-contents');

        GEN.CONTENT = $(VARS.html.content);

        GEN.layout = new GEN_LAYOUT(VARS.html.view);

        GEN.service = new GENSERVICE(GEN);

        GEN.layout.rowDeleteConfirm = function (rowHtml) {
            if (rowHtml) {
                const holders = rowHtml.find('.' + VARS.class.containersHolder);
                $.each(holders, function (i, h) {
                    const id = $(h).attr('id');
                    GEN.removeContainer(id);
                });
            }
            //console.log(CONTAINERS)
        }

        GEN.imagesURL = genparams && genparams.imagesURL ? genparams.imagesURL : '';

        GEN.sourcePath = genparams.sourcePath ? genparams.sourcePath : path + '/core/formgen/util/gen.source.xml';

        GEN.images = {}

        modules = {
            holder: $('#gen-apps-modules-frame'),
            iframe: $('#gen-apps-modules-frame iframe'),
            saveLink: $('#gen-apps-modules-frame').attr('link'),
            show: function (e) {
                IGRP_blackBody({pType: true});
                modules.holder.show();
            },
            hide: function (e) {
                modules.holder.hide();
                IGRP_blackBody({pType: false});
            }
        }


        GEN.SETTINGS = {
            //title   : '',
            instance: '',
            table: '',
            package: '',
            html: '',
            gentype: $('.gen-page-setter[rel="gentype"] option[selected]').val() || 'java',
            replace: false,
            label: false,
            biztalk: false,
            process: false,
            subversionpath: '',

            GET: function (attr) {
                return GEN.SETTINGS.hasOwnProperty(attr) ? GEN.SETTINGS[attr] : '';
            },
            SET: function (attr, val) {

                if (GEN.SETTINGS.hasOwnProperty(attr))

                    GEN.SETTINGS[attr] = val;

                if (typeof val == 'boolean')
                    $('.gen-page-setter[rel="' + attr + '"]').prop('checked', val)
                else
                    $('.gen-page-setter[rel="' + attr + '"]').val(val);

                GEN.SETTINGS.checkBtn();

            },
            checkBtn: function () {

                if (GEN.SETTINGS.GET('package') && GEN.SETTINGS.GET('html') && GEN.SETTINGS.GET('subversionpath'))
                    $('#gen-execute-subv').removeAttr('disabled');
                else
                    $('#gen-execute-subv').attr('disabled', 'disabled');

            },
            toJson: function () {
                const rtn = {};

                for (let s in GEN.SETTINGS) {
                    if (typeof GEN.SETTINGS[s] != 'function')
                        rtn[s] = GEN.SETTINGS[s];
                }

                return rtn;
            },

            hide: function () {
                GEN.shadow(false);
                $('#content[rel="gen-contents-holder"]').removeClass('editing');
                $('#gen-page-settings').removeClass('active');
            },
            show: function () {
                GEN.shadow(true);
                //$('#gen-settings-title').text('Propriedades da P\u00e1gina');
                $('#content[rel="gen-contents-holder"]').addClass('editing');
                $('#gen-page-settings').addClass('active');
            },
            toggle: function () {
                $('#content[rel="gen-contents-holder"]').toggleClass('editing');
                $('#gen-page-settings').toggleClass('active');
            }
        }

        GEN.SETTINGS.checkBtn();

        //get icons
        GEN.getImagesFromDir({
            dir: path + '/core/fontawesome/fa.icons.json',
            id: 'fontawesome',
            callback: function (icons) {

                const list = {};

                for (let categories in icons) {
                    const items = icons[categories];
                    for (let i in items) {

                        if (!list[i]) {
                            list[i] = items[i];
                        } else {
                            items[i].duplicated = true;
                        }
                    }
                }

                GEN.icons.fontawesome = typeof icons == 'string' ? $.parseJSON(icons) : icons;

                VARS.fontawesome.setHTML(GEN.icons.fontawesome);

            }
        });

    };
    const loadData = function (url, callback) {

        _import(true);

        $.ajax({

            url: url,
            //cache:false,
            success: function (d, s, r) {

                const contentType = r.getResponseHeader('content-type') || 'json';

                const type = contentType.split(';')[0];

                if (type.indexOf('xml') !== -1)

                    transformXMLtoJson(d, function (str) {

                        GEN.import(str, {callback: callback})

                    });

                else
                    GEN.import(d, {callback: callback});
            },
            error: function () {

                console.log('error loading data!');

                _import(false);

            },
            complete: function (r) {
                /*var contentType = r.getResponseHeader('Content-Type');
				var type = contentType.split(';')[0];
				var data = r.responseText;

				if(type.indexOf('xml') != -1)
					transformXMLtoJson(data, function(str){GEN.import(str,{callback:callback})});
				else
					GEN.import(data,{callback:callback});*/
            }
        });
    };
    const initBlank = function () {
        GEN.layout.addRow({index: 0});
        GEN.done();
    };
    const loadPageContents = function (p) {

        if (baseXslSet && configDataSet) {

            const id = p.id ? p.id : getPageId();
            if (id) {
                //GET PAGE DETAILS AND LOAD CONTENTS
                $.ajax({
                    url: GEN.UTILS.link_page_detail + id,
                    success: function (pageDetailsStr) {
                        //console.log(pageDetailsStr)
                        GEN.DETAILS = typeof pageDetailsStr == 'string' ? $.parseJSON(pageDetailsStr) : pageDetailsStr;

                        $('#gen-page-title').text(GEN.DETAILS.action_descr).hide();
                        //console.log(GEN.DETAILS)

                        loadDomains(function () {

                            $.ajax({
                                url: GEN.UTILS.link_page_list + GEN.DETAILS.app,
                                success: function (str) {
                                    try {
                                        GEN.DETAILS.linkPageList = typeof str == 'string' ? $.parseJSON(str) : str;

                                        setContainerCopyOptions();

                                    } catch (e) {
                                        console.log('invalid json: ' + str);
                                    }
                                },
                                complete: function () {
                                    //LOAD PAGE CONTENT

                                    if (p.source) {
                                        loadData(p.source, function () {

                                            setNewGenPage({
                                                title: GEN.DETAILS.action_descr,
                                                id: id
                                            });

                                            executeEvents(readyEvents);
                                        });
                                    } else {
                                        initBlank();
                                        executeEvents(readyEvents);
                                    }
                                }
                            });

                        });

                        //GET PAGE LINKS LIST
                    }
                });
            } else {
                initBlank();
            }

        }
    };
    const setEvents = function () {

        $(document).keydown(function (event) {

            if ((event.ctrlKey || event.metaKey) && event.which === 83) {

                event.preventDefault();

                $('.form-gen-save').click();

                return false;
            }

        });

        $(document).on('click', '.gen-editor-errors table tr', function () {

            if (GEN.server.activeMenu.editor) {

                const line = ($(this).attr('line') * 1) - 1;

                GEN.server.activeMenu.editor.setSelection({line: line, ch: 0}, {line: line})

            }

        });

        $('.gen-download-content').on('click', function (e) {

            try {
                const editor = getActiveEditor();
                if (editor) {
                    const name = GEN.DETAILS.filename.split('.xsl')[0];
                    const type = getEditorType();

                    const value = type === 'xml' || type === 'xsl' ? vkbeautify.xml(value) : editor.getValue();

                    const href = "data:text/plain;charset=UTF-8," + editor.getValue();

                    const fileName = name + '.' + type;

                    $(this).attr('href', href);
                    $(this).attr('download', fileName)

                }

            } catch (error) {
                console.log(error);
            }
            //return false;
        });

        $('.gen-copy-to-clipboard').on('click', function (e) {
            const _this = $(this);
            try {
                const editor = getActiveEditor();

                if (editor) {

                    const value = editor.getValue();

                    copyToClipboard(value, function () {
                        _this.addClass('active');

                        setTimeout(function () {
                            _this.removeClass('active');
                        }, 500);

                        editor.execCommand('selectAll')
                    });
                }

            } catch (error) {
                console.log(error);
            }
            return false;
        });
//		Change theme of the codemirror
        $('#code-mirror-theme-selector').on('click', function () {

            const activeEditor = getActiveEditor();
            if (activeEditor) {
                activeEditor.setOption('theme', $(this).val());
            }
            if (GEN.server.activeMenu.editor) {
                GEN.server.activeMenu.editor.setOption('theme', $(this).val());
            }
        });


        //subversionpathERSION APPLET CONTROLLER
        $('#gen-execute-subv').on('click', function () {
            setPLSQLValue({
                callback: function () {
                    svapi.executeActiveX(GEN.SETTINGS.toJson());
                }
            });
            return false;
        });

        //GEN VIEWS CONTROLLER
        $(VARS.html.viewsController).on('click', function (e) {
            const ctrl = $(this),
                rel = ctrl.attr('rel'),
                viewr = $('#' + rel),
                editorName = rel.substring(4),
                editor = GEN[editorName + 'Editor'];

            $('.gen-viewers-toolbar .gen-page-setts-ctrl').hide();

            $('.gen-viewers-toolbar .gen-toolbar-items').hide();

            const callback = function () {

                $(VARS.html.viewers).removeClass('active');

                $(VARS.html.viewsController).removeClass('active');

                ctrl.addClass('active');

                viewr.addClass('active');

                if (rel !== 'gen-design')
                    $.IGRP.components.sideBar.hide();
                else
                    $.IGRP.components.sideBar.show();

                if (editor) {
                    editor.refresh();
                    editor.focus();
                }

                $('body').attr('view', rel);

                try {

                    $('.gen-viewers-toolbar .gen-toolbar-items[rel*="' + rel.split('gen-')[1] + '"]').show();

                } catch (_err) {

                }


                executeEvents(viewChangeEvents, {
                    id: rel,
                    view: rel.split('gen-').join('')
                });

            };

            //XSL VIEW
            switch (rel) {

                case 'gen-css':
                    setCSSValue(callback);
                    break;

                case 'gen-js':
                    setJSValue(callback);
                    break;

                case 'gen-xsl':
                    setXSLValue(callback);
                    break;

                case 'gen-xml':
                    setXMLValue(callback);
                    break;

                case 'gen-plsql':

                    if (GEN.SETTINGS.html && GEN.SETTINGS.package) {
                        setPLSQLValue({
                            callback: callback
                        });
                        //console.log($('#gen-page-setts-ctrl'))

                    } else {
                        openPLSQLSettings('plsql');
                    }
                    break;

                case 'gen-java':

                    if (GEN.SETTINGS.html && GEN.SETTINGS.package) {

                        genUICode({
                            mode: 'java',
                            callback: callback

                        })
                        /*setPLSQLValue({
							rel:'gen-java',
							callback:callback
						});*/
                    } else {
                        openPLSQLSettings('java');
                    }
                    break;

                default:
                    codeEditorView(false);
                    callback();
            }

            GEN.resizeCodeMirrorArea();

            GEN.SETTINGS.hide();

        });
        //views controllers submenu
        $('.gen-v-types-sub-item').on('click', function (e) {
            e.stopPropagation();
        });

        /*drag containers*/
        $(VARS.html.containers + ',' + VARS.html.htmls).draggable({
            helper: function (e) {
                return GEN.getItemBeforeDrop($(e.currentTarget).attr('name'));
            },
            start: function (e, ui) {
                $(e.currentTarget).addClass('draggin')
            },
            stop: function (e, ui) {
                $(e.target).removeClass('draggin')
            },
            cursor: 'move',
            scroll: false,
            zIndex: 1000,
            connectToSortable: VARS.html.containersPlaceHolder
        });

        $(VARS.html.fields).draggable({
            helper: function (e) {
                return GEN.getItemBeforeDrop($(e.currentTarget).attr('name'), 'field').attr('style', 'min-height:12px;visibility:hidden')
            },
            cursor: 'move',
            zIndex: 1000,
            scroll: false,
            start: function (e, ui) {
                $(e.currentTarget).addClass('draggin')
            },
            stop: function (e, ui) {
                $(e.target).removeClass('draggin')
            },
            connectToSortable: '.gen-sortable'
        });


        $('#download-gen-xsl').on('click', function () {
            genxsl.download();
            return false;
        });

        /*EDITION CONTROLLERS*/
        /*$('.gen-edition-title-ctrl').on('click',function(){
			var rel = $(this).attr('rel');
			var content = $('.gen-edition-contents[rel="'+rel+'"]');

			$('.gen-edition-contents').not(content).slideUp(300);
			content.slideDown(300);

			$('.gen-edition-title-ctrl').removeClass('active');
			$(this).addClass('active');
		});*/

        //edition menu
        $('#gen-edition-modal .modal-header ul li').on('click', function () {
            const rel = $(this).attr('rel');
            $('.gen-properties-setts-holder').removeClass('active');
            $('.gen-properties-setts-holder[rel="' + rel + '"]').addClass('active');
            $('#gen-edition-modal .modal-header ul li').removeClass('active');

            $('#gen-edition-modal').attr('view', rel);

            $(this).addClass('active');
        });

        //edition xsl templates menu
        $('#gen-edition-modal .object-xsl-templates').on('change', function () {
            const rel = $(this).val();
            if (GEN.edit.object && GEN.edit.object.templates)
                GEN.edit.setXSLValue(GEN.edit.object.templates[rel])

        });

        //LABEL / TITLE keyup to set autotag
        $(VARS.edition.modal + ' [rel="properties"]').on('keyup', '.propriety-setter[rel="label"]', function () {
            const o = GEN.edit.object;
            if (o.autoTag) {
                const val = $(this).val();
                $(VARS.edition.modal + ' [rel="properties"] .propriety-setter[rel="tag"]').val(replaceSpecialChars(val))
            }
        });

        /*edition confirm*/
        $('#gen-edit-confirm').on('click', function () {

            GEN.confirmEdition();

        });

        $(VARS.edition.dialog).on('click', '[rel="gen-edt-cancel"]', function () {
            GEN.edit.hide();
        });

        $(VARS.edition.modal).on("hidden.bs.modal hidden", function () {
            GEN.edit.hide();
        });

        //apply edition
        $(VARS.edition.dialog).on('click', '[rel="gen-edt-apply"]', function () {
            if (GEN.edit.object) {
                if (GEN.edit.object.genType === 'container')
                    GEN.edit.object.Transform();
                else
                    GEN.edit.object.parent.Transform()
            }
            //GEN.edit.hide();
            return false;
        });

        //RULES EVENTS
        GENRULES.init($('#gen-rules-holder')[0]);

        //PAGE SETTINGS CONTROLLERS---------------------
        /*$('.gen-page-setter.text').on('blur',function(){
			var rel   = $(this).attr('rel'),
				value = $(this).val();

			GEN.SETTINGS.SET(rel,value);
		});

		$('.gen-page-setter.checkbox').on('change',function(){
			var rel       = $(this).attr('rel'),
				isChecked = $(this).is(':checked');

			GEN.SETTINGS.SET(rel,isChecked);
		});

		$('.gen-page-setter.select').on('change',function(){
			var rel   = $(this).attr('rel');
			var value = $(this).val();

			GEN.SETTINGS.SET(rel,value);
		});*/

        $('#gen-page-setts-confirm').on('click', function () {

            const modal = $('#gen-settings-modal'),

                fields = $('input[required]', modal);

            if (fields.valid()) {
                const trsf = modal.attr('transformer') || getActiveEditorName();

                $.each($('.gen-page-setter'), function (i, s) {
                    const setter = $(s);
                    const rel = setter.attr('rel');
                    const val = setter.attr('type') === 'checkbox' ? setter.is(':checked') : setter.val();

                    GEN.SETTINGS.SET(rel, val);
                });

                $(VARS.html.viewsController + '[rel="gen-' + trsf + '"]').click();

                if (modal[0].confirmCallback && typeof modal[0].confirmCallback === 'function')

                    modal[0].confirmCallback();

                $('.gen-btn-service', modal).remove();

                modal.modal('hide');
            }

        });

        $('#gen-settings-modal').on('hidden.bs.modal', function () {

            this.confirmCallback = null;
            $('.gen-btn-service', this).remove();

        });

        $('.gen-page-setts-ctrl').on('click', function () {

            //var editorName = getActiveEditorName() || 'plsql';

            //GEN.SETTINGS.gentype = editorName;
            openPLSQLSettings();
        });

        $('.gen-page-setter').on('keyup change', function () {
            GEN.SETTINGS.checkBtn();
        });
        //
        //---------------------------------------------
        $(VARS.html.view).off('click', '.bClick');

        $(VARS.html.view).on('click', '.bClick', function () {
            return false;
        });

        /*SAVE PAGE*/
        $('.form-gen-save').on('click', function (e) {

            e.preventDefault();
            $('.form-gen-save .fa-cog').removeClass("hidden");
            const clicked = $(this);

            //console.log( SaveBlocks )

            if (GEN.SETTINGS.html && GEN.SETTINGS.package) {

                const vUrl = $(this).attr('href') ? $(this).attr('href') : $(this).attr('fw_href');
                const pageXML = vkbeautify.xml(GEN.getXML());
                const pageXSL = vkbeautify.xmlmin(GEN.getXSL({
                    removeGenAttrs: true
                }));

                const vItemId = getPageId();

                const exportJSON = GEN.export();

                const vParam = [
                    {name: 'p_data', value: exportJSON},//json
                    {name: 'p_page_xml', value: pageXML},//xml
                    {name: 'p_page_xsl', value: pageXSL},//xsl
                    //{ name:'p_page_java',value:javaStr},//java
                    //{ name:'p_package', value: GEN.SETTINGS.package}//pacote
                ];

                //$('#igrp-form-gen').trigger('on-page-save', [vParam]);

                console.log(exportJSON);

                const notifyOptions = {
                    delay: 12000,
                    placement: {
                        from: "top",
                        align: "right"
                    },
                    offset: {
                        y: 60
                    }
                };

                const saveArrItems = [
                    {name: 'p_id_objeto', value: vItemId},
                    {name: 'p_table_name', value: GEN.SETTINGS.table},
                    {name: 'p_pkg_html_name', value: GEN.SETTINGS.html},
                ];

                const __genType = GEN.SETTINGS.gentype;

                $('body').attr('has-message', 'false');

                $('#gen-noif-holder').html('');

                const compileCallback = function () {

                    try {

                        if (__genType === 'java')

                            saveArrItems.push({name: 'p_package', value: GEN.SETTINGS.package});

                        $.IGRP.utils.submitStringAsFile({
                            pUrl: vUrl,
                            pNotify: false,
                            pLoading: true,
                            pParam: {
                                pArrayFiles: vParam,
                                pArrayItem: saveArrItems
                            },
                            pComplete: function (req, text, status) {

                                let msgs;
                                if (__genType === 'java') {

                                    GEN.removeEditorsErrors(true);

                                    msgs = $($.parseXML(req.response)).find("message[type!='confirm'][type!='debug']");
                                    let nomsg = true;
                                    $('.form-gen-save .fa-cog').addClass("hidden");
                                    $.each(msgs, function (i, msg) {
                                        nomsg = false;
                                        const mtype = $(msg).attr('type'),
                                            jsonStr = $(msg).text(),
                                            jsonRes = JSON.parse(jsonStr),
                                            text = jsonRes.msg;

                                        notifyOptions.type = mtype === 'error' ? 'danger' : mtype;
                                        $.notify({

                                            message: $('<div />').html(text).text(),

                                        }, notifyOptions);

                                        GEN.showEditorsErrors(jsonRes, mtype);
                                    });
                                    if (nomsg) {
                                        console.log("no msg");
                                        notifyOptions.type = 'warning';
                                        $.notify({
                                            message: "Check your login session! No response from server!",

                                        }, notifyOptions);
                                    }

                                    GEN.resizeCodeMirrorArea();

                                } else if (__genType === 'plsql') {

                                    msgs = $(req.response).find("message[type!='confirm'][type!='debug']");

                                    $.each(msgs, function (i, msg) {
                                        const type = $(msg).attr('type');
                                        const text = $(msg).text();

                                        $.notify({
                                            message: text,

                                        }, {
                                            type: 'success',
                                            delay: 8000,
                                        });

                                    });

                                }

                            },
                            pError: function (request) {

                                notifyOptions.type = 'danger';
                                $.notify({
                                    message: request.statusText
                                }, notifyOptions);

                            }
                        });


                    } catch (errr) {
                        $('.form-gen-save .fa-cog').addClass("hidden");
                        $.IGRP.notify({
                            message: "Error 3028: " + err,
                            type: 'alert'
                        });


                    }

                };

                try {

                    if (__genType === 'java')

                        GEN.server.compile({
                            mode: 'java',
                            then: function (results) {
                                results.forEach(function (r) {
                                    const name = r.name.toLowerCase();
                                    vParam.push({
                                        name: 'p_' + name,
                                        value: r.code
                                    });
                                });
                                compileCallback();
                            }
                        });

                    if (__genType === 'plsql')
                        compileCallback();

                } catch (err) {
                    $('.form-gen-save .fa-cog').addClass("hidden");

                    $.IGRP.notify({
                        message: "Error 3064: " + err,
                        type: 'alert'
                    });
                }


            } else {
                openPLSQLSettings(function () {

                    clicked.click();

                });
            }
            return false;
        });

        /* CHANGE APP HANDLER */
        $('#gen-app-choser select').on('change', function () {
            const select = $(this);
            if (!select.hasClass('loadin')) {

//				select.addClass('loadin');

                const vApp = select.val(),
                    vUrl = $("input[name='p_env_frm_url']").val() ? $("input[name='p_env_frm_url']").val() : 'GEN.APP.TEST.xml';

                if (vApp) {
                    $.ajax({
                        url: vUrl,
                        data: select.attr('name') + '=' + vApp,
                        success: function (content) {
                            const xsl = path + '/xsl/tmpl/IGRP-tree-menu.tmpl.xsl';
                            const xml = $(content).find('rows > content > table').getXMLDocument();

                            if (xml) {
                                $('#gen-apps-holder').XMLTransform({
                                    xml: xml,
                                    xsl: xsl,
                                    loading: true,
                                    xslParams: {
                                        template: 'tree-menu',
                                        delete: 'false'
                                    },
                                    complete: function (data) {
                                        select.removeClass('loadin');
                                    },
                                    error: function (error) {
                                        select.removeClass('loadin');
                                    }
                                });
                            } else {
                                select.removeClass('loadin');
                                alert('error')
                            }
                        }
                    });
                }
            }
            return false;
        });

        /*ADD APP MODULE*/
        $('#gen-apps-holder').on('click', '.tree-menu-options .btn', function () {
            const type = 'add';
            const id = $(this).parents('li').find('a').attr('idobj');

            setIframeContentLookup({
                pUrl: modules.saveLink,
                holder: modules.holder,
                iframe: modules.holder.find('iframe'),
                pBeforeReady: function (contents) {
                    contents.find('body').addClass('iframe-full-sreen');
                    contents.find('.box-head.showTabMobile').attr('style', 'display:none!important');
                    contents.find('.bClick[target="_close"]').on('click', modules.hide);
                },
                pCallback: function () {
                    modules.show();
                }
            });

            return false;
        });

        $('#gen-apps-holder').on('click', 'li a[href]', function () {
            const page = $(this);
            if (!page.hasClass('selected') && !GEN.importing) {
                try {
                    loadPageContents({
                        id: page.attr('idobj'),
                        source: page.attr('href')
                    });
                } catch (e) {
                    console.log(e)
                }
            }
            return false;
        });


        //before unload
        window.onbeforeunload = function () {
            return "Tenha aten\u00e7\u00e3o \u00e0s altera\u00e7\u00f5es!";
        };

        GEN.edit.XSLEditor = CodeMirror($('#gen-edit-xsl')[0], {
            lineNumbers: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter", "CodeMirror-lint-markers"],
            lineWrapping: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            readOnly: false,
            mode: "xml",
            matchTags: {bothTags: true},
            autofocus: true,
            enterMode: 'indent',
            smartIndent: true,
            extraKeys: {
                "'<'": CM_XSLT_completeAfter,
                "'/'": CM_XSLT_completeIfAfterLt,
                "' '": CM_XSLT_completeIfInTag,
                "'='": CM_XSLT_completeIfInTag,
                "Ctrl-J": "toMatchingTag",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                },
                "Ctrl-Space": function (cm) {
                    CodeMirror.showHint(cm, CodeMirror.hint.xml, {schemaInfo: CM_XSLT_tags});
                }
            }
        });

        GEN.edit.XSLEditor.on('change', function (e) {
            //GEN.edit.saveChanges(e.getValue());
        })

        GEN.edit.XSLEditor.on('mousedown', function (e) {
            //xslEditing = true;
        });

        GEN.edit.XSLEditor.on('blur', function (e) {
            //xslEditing = false;
        });

        //MESSAGES CONTROL
        $('#gen-noif-holder').on('click', '.close', function () {
            const qtd = $('#gen-noif-holder .notification').length - 1;
            if (qtd === 0)
                $('body').attr('has-message', 'false')
        });

        $(window).resize(function () {
            resizeCodeMirrorArea();
        });

        $('body').on('click', '.container-contents a[target],.container-contents button[target]', function (e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        });

        /*sort containers*/
        //GEN.configSortable($(VARS.html.containersPlaceHolder));
    };
    const setHtmlStyle = function (o) {

        if (o && o.customStyle) {

            const itemHolder = $('>.container-contents>.gen-container-item', o.holder),

                setClss = itemHolder.attr('gen-class');

            itemHolder.attr('id', o.customStyle.id);

            itemHolder.removeClass(setClss).addClass(o.customStyle.class);

            itemHolder.attr('style', o.customStyle.inline);

        }

    };
    const isIncluded = function (name) {
        let rtn = false;
        for (let i = 0; i < TMPL_INCLUDES.length; i++) {
            if (TMPL_INCLUDES[i] === name) {
                rtn = true;
                break;
            }
        }
        return rtn;
    };
    const genUICode = function (params) {

        GEN.server.set(params);


        /*//console.log(params);
		var server = genparams.server || {},

			codes  = server[params.mode];

		if(codes[0]){



		}

		params.callback();*/

    };
    const configCodeEditor = function () {
        /*get editor*/
        GEN.xslEditor = CodeMirror($(VARS.html.codeArea)[0], {
            //value: content,
            mode: "application/xml",
            matchTags: {bothTags: true},
            lineNumbers: true,
            extraKeys: {
                "Ctrl-J": "toMatchingTag",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                }
            },
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter", "CodeMirror-lint-markers"],
            autofocus: true,
            enterMode: 'indent',
            smartIndent: true,
            lineWrapping: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            readOnly: true
        });

        GEN.xslEditor.refresh();
        GEN.xslEditor.focus();

        /*xml Editor*/
        GEN.xmlEditor = CodeMirror($('#gen-xml-view')[0], {
            matchTags: {bothTags: true},
            autofocus: true,
            lineNumbers: true,
            enterMode: 'indent',
            smartIndent: true,
            extraKeys: {
                "Ctrl-J": "toMatchingTag",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                }
            },
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter", "CodeMirror-lint-markers"],
            readOnly: true,
            lineWrapping: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            mode: "text/xml"
        });
        GEN.xmlEditor.refresh();
        GEN.xmlEditor.focus();

        //CSS
        /*css Editor*/
        GEN.cssEditor = CodeMirror($('#gen-css-view')[0], {
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            mode: "text/x-less"
        });

        GEN.cssEditor.on('blur', setCustomCSStoView);

        GEN.cssEditor.refresh();
        GEN.cssEditor.focus();

        /*JS Editor*/
        GEN.jsEditor = CodeMirror($('#gen-js-view')[0], {
            lineNumbers: true,
            matchTags: {bothTags: true},
            extraKeys: {
                "Ctrl-J": "toMatchingTag",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                }
            },
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter", "CodeMirror-lint-markers"],
            autofocus: true,
            enterMode: 'indent',
            smartIndent: true,
            lineWrapping: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            mode: "text/javascript"
        });

        GEN.jsEditor.on('blur', setCustomJStoView);

        GEN.jsEditor.refresh();
        GEN.jsEditor.focus();

    };
    const setPLSQLValue = function (params) {
        const p = params ? params : {};
        const rel = p.rel ? p.rel : 'gen-plsql';
        const btnController = p.controller ? p.controller : $(VARS.html.viewsController + '[rel="' + rel + '"]');
        const viewr = $('#' + rel);

        btnController.removeClass('active');

        const xsltPath = btnController.attr('xslt-path');
        const xsltFile = btnController.attr('xslt-file');
        const txtarea = $('#' + rel + ' textarea');
        const isIE = !!(window.ActiveXObject || window.navigator.userAgent.match(/rv:11.0/i));
        const enterParam = '$$enter$$';

        //var mainXml = GEN.getXML();

        const xslParams = isIE ? {jsEnter: enterParam} : false;
        const xmlStr = GEN.getXML();

        const plsqlXML = $.parseXML(xmlStr);

        if (isIE)
            replaceSpace($(plsqlXML));

        GEN.waiting();

        $('<div/>').XMLTransform({
            xml: plsqlXML,
            xsl: xsltPath + '/' + xsltFile,
            xslParams: xslParams,
            xslBasePath: xsltPath,
            complete: function (d, e) {

                let content = d.text();

                const editorName = rel.split('gen-')[1] || 'plsql';

                const editor = GEN[editorName + 'Editor'] || GEN.plsqlEditor;

                const beginExp = '#gen(';

                const endExp = ')/#';


                const cback = function (content) {

                    if (isIE) {
                        content = content.replaceAll(enterParam, '\n');
                        content = content.replaceAll('$SPACE$', ' ');
                        content = content.replaceAll('$space$', '_');
                    }

                    const fBegin = getIndicesOf(beginExp, content),

                        fEnd = getIndicesOf(endExp, content);

                    if (fBegin[0])
                        $.IGRP.notify({
                            message: 'Something went wrong preserving your code. review your PL/SQL code!',
                            type: 'warning'
                        });

                    editor.setValue(content);

                    $(VARS.html.viewsController).removeClass('active');

                    if (params.activateBtn !== false)

                        btnController.addClass('active');

                    codeEditorView(true);

                    GEN.done();

                    if (p.callback) p.callback(content);

                    editor.refresh();

                    $('.gen-viewers-toolbar .gen-page-setts-ctrl').show();
                };

                /* GOOGLE CHROME XSLT document() function hack */
                //if(isIE){
                //cback(content);
                //}else{

                const begin = getIndicesOf(beginExp, content);

                const end = getIndicesOf(endExp, content);

                const canPreserve = begin.length === end.length;

                if (canPreserve && begin[0] && end[0])

                    preserve_code(begin, {

                        content: content,

                        end: end,

                        callback: function (obj) {

                            obj.forEach(function (o) {

                                const oldText = o.oldText ? $.trim(o.oldText) : '';

                                const currentText = o.text ? $.trim(o.text) : '';

                                let _cnt = currentText || oldText;

                                _cnt = $.trim(_cnt) === o.expression ? '' : _cnt;

                                content = content.replaceAll(o.expression, '\n\n' + _cnt);
                            });

                            const eBegin = getIndicesOf(beginExp, content),

                                eEnd = getIndicesOf(endExp, content);

                            if (eBegin[0]) {

                                $.IGRP.notify({
                                    message: 'Something went wrong preserving your code. review your PL/SQL code!',
                                    type: 'warning'
                                });

                                preserve_code(eBegin, {

                                    content: content,

                                    end: eEnd,

                                    callback: function (obj) {

                                        obj.forEach(function (o) {

                                            console.log($.trim(o.text) === o.expression);

                                            content = content.replaceAll(o.expression, '\n\n' + $.trim(o.text));
                                        });

                                        cback(content);

                                    }

                                });

                            } else {

                                cback(content);
                            }


                        }

                    });
                else
                    cback(content);
                /* /GOOGLE CHROME XSLT document() function hack */

            },
            error: function (e) {
                console.log(e);
            }
        });


    };
    const configPLSQLEditor = function () {
        /*get editor*/
        GEN.plsqlEditor = CodeMirror($('#gen-plsql-view')[0], {
            mode: 'text/x-plsql',
            readOnly: true,
            lineNumbers: false,
            matchBrackets: true,
            hintOptions: {
                tables: {
                    users: {name: null, score: null, birthDate: null},
                    countries: {name: null, population: null, size: null}
                }
            }
        });
        GEN.plsqlEditor.refresh();
        GEN.plsqlEditor.focus();
    };
    const GEN = this;

    const declaredContainers = [];
    const declaredFields = [];
    const declaredHtmls = [];
    let CONTAINERS = [];
    const TMPL_INCLUDES = [];
    let modules = null;
    let counter = 0;
    let xslEditing = false;
    let baseXslSet = false;
    let configDataSet = false;
    const acceptsRules = ['hidden', 'checkbox', 'radio'];

    const version = (new Date()).getDate();

    /*EVENTS ARRAY*/
    const readyEvents = [];

    const initEvents = [];

    const viewChangeEvents = [];

    const xslTmplPath = path + '/xsl/tmpl/';

    GEN.params = genparams;

    GEN.svApplet = null;

    GEN.XML = $($.parseXML(VARS.xml.init));

    GEN.XSL = null;

    GEN.importing = false;

    GEN.STRUCTURE = new GENSTRUCTURES(GEN);

    GEN.path = path + VARS.genPath;

    GEN.defaultIncludes = ['functions', 'variables', 'home-include', 'utils'];

    GEN.icons = {};

    GEN.proprieties = {};

    GEN.SET = {};

    GEN.GET = {};

    GEN.propertiesLabels = {};

    GEN.domains = {};

    GEN.dom = $('#igrp-form-gen');

    GEN.files = {
        css: [],
        js: [],
        xsl: []
    };

    GEN.pfiles = { // process files include
        css: [
            {file: '/core/igrp/toolsbar/toolsbar'},
            {file: '/core/igrp/process/process'},
            {file: '/plugins/view/igrp.view'}
        ],
        js: [],
        xsl: [
            {file: 'IGRP-process-utils'}
        ]
    };

    GEN.tags = {

        list: {

            containers: {},

            fields: {}

        },

        cycle: function (tag, arr, object) {

            let r = true;
            const id = object.GET && object.GET.id ? object.GET.id() : -1;

            for (let i = 0; i < arr.length; i++) {

                const c = arr[i];

                if (c.GET.id() !== id) {

                    const t = c.GET.tag();

                    if (t === tag) {

                        r = false;

                        break;

                    }

                }

            }

            return r;
        },

        valid: function (tag, object) {
            //console.log(object)
            const r = true,

                t = object.genType,

                a = t === 'container' ? GEN.getContainers() : GEN.getAllFields();

            return GEN.tags.cycle(tag, a, object);

        }

    };

    GEN.init = function () {
        setVars();
        getConfigData();
        getBaseXSL();
        setEvents();
    }

    GEN.getContainer = function (id) {
        let rtn = null;
        for (let x = 0; x < CONTAINERS.length; x++) {
            if (CONTAINERS[x].id === id) {
                rtn = CONTAINERS[x];
                break;
            }
        }
        return rtn;
    }

    GEN.getContainerByTag = function (tag) {
        let rtn = null;
        for (let x = 0; x < CONTAINERS.length; x++) {
            if (CONTAINERS[x].GET.tag() === tag) {
                rtn = CONTAINERS[x];
                break;
            }
        }
        return rtn;
    }

    GEN.getContainers = function () {
        return CONTAINERS;
    }

    GEN.getContainerFolder = function (type) {
        return VARS.genPath + '/types/containers/' + type;
    }

    GEN.getFieldFolder = function (type) {
        return VARS.genPath + '/types/fields/' + type;
    }

    GEN.validateContainerTag = function (container) {
        let count = 0;
        CONTAINERS.forEach(function (c, i) {
            if (c.GET.type() === container.GET.type()) {
                count++;
                if (c.proprieties.tag === container.proprieties.tag)
                    container.proprieties.tag = container.GET.tag() + count;
            }
        });
    }

    GEN.openIgrpDoc = function (type) {

        if ($('#igrp-doc')[0] && $('#link_doc')[0]) {
            let url = $('#link_doc').val();

            url += url.indexOf('?') !== -1 ? '&' : '?';

            url += 'target=_blank&p_type=' + type;

            $('#igrp-doc').attr({'href': url, 'position': type});
        }
    }

    const tagsIncr = {};

    const isTagValid = function (tag) {
        let rtn = true;
        for (let i = 0; i < CONTAINERS.length; i++) {
            const o = CONTAINERS[i];

            if (o.GET.tag() === tag) {
                rtn = false;
                break;
            }
        }
        return rtn;
    };

    const validateTag = function (tag, incr) {
        let validTag = tag;
        const objects = GEN.getContainers();
        const idx = incr ? incr + 1 : 1;

        if (isTagValid(validTag + '_' + idx)) {
            validTag = validTag + '_' + idx;
        } else {
            validTag = validateTag(tag, idx);
        }
        //console.log(idx);
        //console.log(isTagValid(tag+'_'+idx))
        //validTag = isTagValid(tag+'_'+idx) ? tag+'_'+idx : validateTag(tag,idx);
        return validTag;
    };

    GEN.initHtml_ROW = function (p) {

    }

    GEN.initContainer_ROW = function (p) {
        //console.log(p);
        //try{
        const genType = p.genType;

        const type = p.object.GET.type();

        const placeHolder = p.placeholder ? p.placeholder : p.column.find('>.gen-column-inner >' + VARS.html.containersPlaceHolder);

        const callback = p.callback ? p.callback : false;

        const fromSortable = placeHolder.find('>' + VARS.html.declaredContainers + ':eq(' + p.index + ')')[0];

        const holder = p.holder && p.holder[0] ? p.holder : GEN.getItemBeforeDrop(type);

        p.object.order = p.index;

        CONTAINERS.push(p.object);
        //init container: declare container holder

        p.object.init(callback);

        holder.append(p.object.holder);

        GEN.checkColumnComponents(p.column);

        if (!fromSortable || p.clone)

            p.column.find('> .gen-column-inner >' + VARS.html.containersPlaceHolder).insertAt(holder, p.object.order);


        counter++;

        /*}catch(e){
			console.log(e);
		}*/
    }

    GEN.initObject_ROW = function (p) {
        //if(p.genType == 'container'){
        GEN.initContainer_ROW(p);
        //}
    }

    GEN.setContainer = function (container) {
        const genXMLElement = GEN.XML.find('content > ' + container.GET.tag());

        if (genXMLElement[0])
            genXMLElement.replaceWith(containerXML.documentElement);
        else
            GEN.XML.find('content').insertAt(containerXML.documentElement, container.order);
    }

    GEN.checkColumnComponents = function (col) {

        if (col.find('>.gen-column-inner>.gen-container-placeholder>.gen-declared-containers')[0])
            col.attr('empty', false);
        else
            col.attr('empty', true);

        col.removeClass('distance-bottom');
    }

    GEN.getXML = function (p) {
        const _params = p ? p : {};
        let rtn = '';
        const filename = GEN.DETAILS ? GEN.DETAILS.filename : '',
            page = GEN.DETAILS ? GEN.DETAILS.page : '',
            app = GEN.DETAILS ? GEN.DETAILS.app : '',
            actionD = GEN.DETAILS ? GEN.DETAILS.action_descr : '',
            blocklyXML = GetDefaultBlocklyXML(),

            blocklyImports = GetBlocklyImports();
        const subpath = filename.substring(1);
        //rtn+='<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet href="'+'..'+subpath.substring(subpath.indexOf('/'))+'" type="text/xsl"?>';
        rtn += '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet href="' + filename + '" type="text/xsl"?>';

        rtn += '<rows>';
        rtn += VARS.xml.site;
        //page
        rtn += '<page>' + page + '</page>';
        //app
        rtn += '<app>' + app + '</app>';
        //plsql
        rtn += VARS.xml.plsql();
        //slide menu
        rtn += '<slide-menu file="../images/IGRP/IGRP2.3/xml/IGRP-slide-menu.xml?v=2" />';
        //top menu
        rtn += '<top_menu file="../images/IGRP/IGRP2.3/xml/IGRP-top_menu.xml?v=2" />';
        //content
        rtn += '<content>';
        rtn += '<title>' + actionD + '</title>';
        //containers
        if (_params.containersIDs) {
            _params.containersIDs.forEach(function (id) {
                const container = GEN.getContainer(id);
                if (container && container.getXML) {

                    rtn += $(container.getXML()).getXMLStr();

                    if (container.onXMLGenerate)
                        rtn += container.onXMLGenerate(rtn);
                }
            });
        } else {
            GEN.getContainers().forEach(function (c) {

                if (c.getXML) {

                    rtn += $(c.getXML()).getXMLStr();

                    if (c.onXMLGenerate)
                        rtn += c.onXMLGenerate(rtn);
                }
            });
        }

        rtn += '</content>';
        if (GEN.GET.service && GEN.GET.service().code)
            rtn += GEN.getFieldServiceMap(GEN.GET.service());
        rtn += '<blockly>' + blocklyImports + blocklyXML + '</blockly>';
        rtn += '</rows>';


        return rtn;
        //return $.parseXML(rtn);
    }

    const removeGenAttrs = function (c) {
        const xsl = $($.parseXML(c));

        xsl.find('[gen-item-id]').removeAttr('gen-item-id');

        xsl.find('[gen-id]').removeAttr('gen-id');

        xsl.find('[gen-field-template]').removeAttr('gen-field-template');

        xsl.find('[gen-lbl-setter]').removeAttr('gen-lbl-setter');

        return xsl.getXMLStr();
    };

    let msgSet = false;

    GEN.getXSL = function (options) {

        const o = options ? options : {};

        let _c = getXSLTop();

        msgSet = false

        const layoutRows = GEN.layout.getRows(true);

        _c += GEN.designRows(layoutRows, {
            main: true
        });

        _c += getXSLBottom();

        _c = GEN.setIGRPMessageTmpl(_c);

        if (GEN.SETTINGS.process)
            _c = GEN.tmplProcessUtils(_c);

        if (o.removeGenAttrs)
            _c = removeGenAttrs(_c);

        return _c;
    }

    GEN.tmplProcessUtils = function (c) {
        try {
            const doc = $($.parseXML((' ' + c).slice(1))),

                content = doc.find('#igrp-contents .content'),

                rows = content.find('>.row[id]');

            $('<xsl:call-template name="dynamic-tmpl-end"/>').insertAfter(rows);

            $('<xsl:call-template name="dynamic-tmpl-start"/>').insertBefore(rows);

            c = (new XMLSerializer()).serializeToString(doc[0]).replaceAll('xmlns="http://www.w3.org/1999/xhtml"', '');

        } catch (err) {
            console.log(err);
            console.log('ERROR SETTING IGRP PROCESS UTILS');
        }
        return c;
    };

    GEN.designRows_old = function (layoutRows, p) {
        const dParams = p ? p : {};

        let _c = '';

        const messageTMPL = '<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>';

        const isFirstFluid = !!(layoutRows[0].propreties && layoutRows[0].propreties.class === 'row-fluid');

        const hasMoreThanOneRow = layoutRows.length > 1;

        /*//one row - not fluid
		if(!hasMoreThanOneRow && !isFirstFluid){
			c+='<MESSAGE>MESSAGE</MESSAGE>'
		}

		layoutRows.forEach(function(row,i){

			//console.log(row);
			console.log('<row/>');

			if(isFirstFluid && !hasMoreThanOneRow){
				c+='<MESSAGE>MESSAGE</MESSAGE>'
			}

		});*/


        layoutRows.forEach(function (row, i) {

            const isFullRow = row.columns[0] && row.columns[0].size === 'col-md-12';

            if (!isFullRow && i === 0 && !msgSet) {
                _c += '<div class="row">';
                _c += '<div class="gen-column col-md-12"><div class="gen-inner">';
                _c += messageTMPL;
                msgSet = true;
                _c += '</div></div>';
                _c += '</div>';
            }

            _c += '<div class="row" id="row-' + guid() + '">';

            row.columns.forEach(function (column, cidx) {
                _c += '<div class="gen-column ' + column.size + '"><div class="gen-inner">';

                const firstIsHeader = column.containers[0] && column.containers[0].proprieties.type === 'sectionheader';

                if (!firstIsHeader && !msgSet && isFullRow) {
                    _c += messageTMPL;
                    msgSet = true;
                }

                column.containers.forEach(function (_container, index) {
                    const container = GEN.getContainer(_container.id);

                    if (container)
                        _c += container.XSLToString();

                    if (i === 0 && cidx === 0 && firstIsHeader && index === 0 && !msgSet && isFullRow) {
                        _c += messageTMPL;
                        msgSet = true;
                    }

                });

                _c += '</div></div>';
            });
            _c += '</div>';
        });

        _c = _c.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"', '');
        _c = _c.replaceAll('xmlns="http://www.w3.org/1999/xhtml"', '');

        return _c;
    }

    GEN.setIGRPMessageTmpl = function (_c, rows) {

        const messageTMPL = '<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>',

            rowMsg = '<div class="row row-msg">'
                + '<div class="gen-column col-md-12"><div class="gen-inner">'
                + messageTMPL
                + '</div></div>'
                + '</div>';

        const tmpl = (' ' + _c).slice(1);

        try {

            var doc = $($.parseXML(tmpl)),

                contents = doc.find('#igrp-contents .content'),

                rows = contents.find('>.row'),

                firstRow = rows.first(),

                isFirstFluid = firstRow.hasClass('row-fluid'),

                firstCol = firstRow.find('.gen-column').first(),

                firstIsNavbar = firstCol.find('>.gen-inner>[tab-template="navbar"]'),

                isFirstHeader = firstCol.find('>.gen-inner>xsl\\:if>section.content-header');

            isFull = !!(firstCol.hasClass('col-sm-12') && isFirstHeader[0]);

            if (isFull || (isFirstFluid && firstIsNavbar.index() === 0)) {

                if (isFirstHeader[0] && isFirstHeader.parent().index() === 0)

                    $(messageTMPL).insertAfter(isFirstHeader.parent());

                else if (firstIsNavbar.index() === 0)

                    $(messageTMPL).insertAfter(firstIsNavbar);

                else
                    contents.prepend($(rowMsg));

            } else {

                if (isFirstFluid) {

                    $(rowMsg).insertAfter(firstRow)

                } else {

                    contents.prepend($(rowMsg));

                }


            }

            _c = (new XMLSerializer()).serializeToString(doc[0]).replaceAll('xmlns="http://www.w3.org/1999/xhtml"', '');


        } catch (err) {
            console.log(err);
            console.log('ERROR SETTING IGRP MESSAGES')
        }

        return _c;
    };

    GEN.designRows = function (layoutRows, p) {

        const dParams = p ? p : {};

        let _c = '';

        layoutRows.forEach(function (row, i) {

            const rowClss = row.propreties ? row.propreties.class : '';

            _c += '<div class="row ' + rowClss + '" id="row-' + guid() + '">';

            row.columns.forEach(function (column, cidx) {
                _c += '<div class="gen-column ' + column.size + '"><div class="gen-inner">';

                column.containers.forEach(function (_container, index) {

                    const container = GEN.getContainer(_container.id);

                    if (container)
                        _c += container.XSLToString();

                });

                _c += '</div></div>';

            });

            _c += '</div>';
        });


        _c = _c.replaceAll('xmlns:xsl="http://www.w3.org/1999/XSL/Transform"', '');

        _c = _c.replaceAll('xmlns="http://www.w3.org/1999/xhtml"', '');

        return _c;
    }


    GEN.removeContainer = function (id) {

        for (let x = 0; x < CONTAINERS.length; x++) {
            const container = CONTAINERS[x];

            if (container.id === id) {
                const idx = CONTAINERS.indexOf(container);
                const column = $(container.holder.parents('.gen-column')[0]);
                if (idx > -1) {

                    if (container.contents) {
                        const contentsContainers = container.holder.find('.gen-container-holder');

                        $.each(contentsContainers, function (i, c) {
                            const cId = $(c).attr('id');
                            const cType = $(c).attr('type');

                            if (cId) GEN.removeContainer(cId);

                        });
                    }

                    container.GET.fields().forEach(function (f) {

                        container.removeField(f.id, false)

                    });

                    container.onRemove();
                    CONTAINERS.splice(idx, 1);
                    container.holder.parent().remove();

                    GEN.checkColumnComponents(column);

                    /**/

                }

                if (GEN.edit.object && container.id === GEN.edit.object.id) GEN.edit.hide();

                counter--;

                break;
            }
        }
    }

    const removeAllContainers = function () {
        for (let x = CONTAINERS.length - 1; x >= 0; x--)
            GEN.removeContainer(CONTAINERS[x].id);
        CONTAINERS = [];
        $(VARS.html.view + '>#gen-design>.gen-rows-holder .row').remove();

    };

    const setUndeclared = function (c) {
        //console.log(declaredContainers);
        const liHolder = $('.gen-declared-containers:eq(' + c.index + ')', c.column);

        if (liHolder.attr('type') === c.name)
            liHolder.addClass('gen-undeclared');

        console.log(c.name + ' not declared!')
    };

    //var getGenFieldObject = function

    GEN.dropContainers_ROW = function (containers, params) {

        hasChanged = true;

        const indx = params && params.index >= 0 ? params.index : 0;

        if (indx < containers.length) {

            const dropped = containers[indx];

            const objectType = dropped.params.genType ? dropped.params.genType : 'container';

            const declared = GEN['getDeclared' + capitalizeFirstLetter(objectType) + 's'] ? GEN['getDeclared' + capitalizeFirstLetter(objectType) + 's'](dropped.name) : null;

            if (declared) {

                if (objectType === 'container') {

                    const fields = [];

                    const _dcb = function (found) {

                        const object = new declared[objectType](dropped.name, dropped.params);

                        const objectParams = {
                            genType: objectType,
                            object: object,
                            index: dropped.index,
                            holder: dropped.holder,
                            row: dropped.row,
                            column: dropped.column,
                            clone: dropped.clone,
                            placeholder: params.placeholder ? params.placeholder : null,
                            callback: function () {

                                GEN.dom.trigger('container-set', [object])

                                GEN.dropContainers_ROW(containers, {
                                    index: indx + 1,
                                    callback: params ? params.callback : null
                                });

                            }
                        };
                        //objectParams
                        GEN.initObject_ROW(objectParams);

                    };

                    if (dropped.params.copy) {
                        //copy fields from given page

                        GEN.getPageJSON(dropped.params.copy.id, function (containers, data) {

                            let rtn = true;

                            if (!containers[0]) {

                                dropped.params.copy = false;

                                if (dropped.params.copy)

                                    dropped.params.copy.found = false;

                                _dcb(rtn);

                            } else {

                                const arr = $.grep(containers, function (c) {

                                    return c.proprieties.tag === dropped.params.copy.container
                                });

                                if (arr[0]) {

                                    const container = arr[0];

                                    dropped.params.copy.plsql = data.plsql;

                                    container.fields.forEach(function (_field) {
                                        const f = GEN.getDeclaredField(_field.properties.type);
                                        if (f) fields.push(new f.field(_field.properties.type, _field));
                                    });

                                    if (container.contextMenu)
                                        dropped.params.contextMenu = container.contextMenu;

                                    dropped.params.fields = fields;

                                    dropped.params.style = container.style;

                                    dropped.params.options = container.options;

                                    dropped.params.xsl = container.xsl;

                                    dropped.params.proprieties = container.proprieties;


                                } else {

                                    rtn = false;
                                }

                                if (dropped.params.copy)
                                    dropped.params.copy.found = rtn;

                                _dcb(rtn);

                            }


                        });

                    } else {


                        //setFields object to Fields()
                        if (dropped.params && dropped.params.fields && dropped.params.fields[0]) {

                            dropped.params.fields.forEach(function (_field) {

                                const fieldObject = jQuery.extend(true, {}, _field);

                                const vField = fieldObject.properties ? fieldObject : {

                                    properties: fieldObject

                                };

                                const f = GEN.getDeclaredField(vField.properties.type);

                                if (f) fields.push(new f.field(vField.properties.type, vField));

                            });
                        }

                        dropped.params.fields = fields;

                        _dcb(true);

                    }
                }


            } else {
                setUndeclared(dropped);
                GEN.dropContainers_ROW(containers, {
                    index: indx + 1,
                    callback: params ? params.callback : null
                });
            }

        } else if (params.callback) {

            params.callback();
        }
    }

    GEN.declareContainer = function (d) {
        if (!GEN.getDeclaredContainers(d.name)) {
            const menuItem = $(VARS.html.containers + '[name="' + d.name + '"]');
            d.accept = menuItem.attr('accept') ? menuItem.attr('accept').split(',') : [];
            d.reject = menuItem.attr('reject') ? menuItem.attr('reject').split(',') : [];
            d.hasField = menuItem.attr('hasfield') !== 'false';

            declaredContainers.push(d);

            menuItem.addClass('active');//set container html visible

        } else {
            console.log('container exists!')
        }
    }

    GEN.getDeclaredContainers = function (name) {
        let rtn = null;
        for (let x = 0; x < declaredContainers.length; x++) {
            if (declaredContainers[x].name === name) {
                rtn = declaredContainers[x];
                break;
            }
        }
        return rtn;
    }

    GEN.getAllDeclaredContainers = function () {
        return declaredContainers;
    }

    GEN.declareHtml = function (h) {
        //console.log(h);
        if (!GEN.getDeclaredHtmls(h.type)) {
            declaredHtmls.push(h);
            $(VARS.html.htmls + '[type="' + h.type + '"]').addClass('active');//set container html visible
        } else {
            console.log('field exists!')
        }
        //console.log(declaredHtmls)
    }

    GEN.getDeclaredHtmls = function (type) {
        let rtn = null;
        for (let x = 0; x < declaredHtmls.length; x++) {
            if (declaredHtmls[x].type === type) {
                rtn = declaredHtmls[x];
                break;
            }
        }
        return rtn;
    }

    GEN.declareField = function (f) {
        if (!GEN.getDeclaredField(f.type)) {
            declaredFields.push(f);
            $(VARS.html.fields + '[type="' + f.type + '"]').addClass('active');//set container html visible
        } else {
            console.log('field exists!')
        }
    }


    GEN.getDeclaredField = function (type) {
        let rtn = null;
        for (let x = 0; x < declaredFields.length; x++) {
            if (declaredFields[x].type === type) {
                rtn = declaredFields[x];
                break;
            }
        }
        return rtn;
    }

    GEN.getDeclaredFields = function () {
        return declaredFields;
    }

    const configAutoTagSetter = function (input, object) {
        const holder = $('<div class="input-group"/>');
        const checkH = $('<div class="input-group-addon" title="Auto Tag" alt="Auto Tag" />');
        const autotag = $('<input type="checkbox" class="autotag-setter"/>');

        autotag.prop('checked', object.autoTag);

        autotag.on('change', function () {
            const val = $(this).is(':checked');
            object.autoTag = val;
            $('.propriety-setter', input).attr('disabled', val);

            if (val)
                $('.propriety-setter[rel="label"]').trigger('keyup');

        });

        checkH.append(autotag);

        if (object.autoTag)
            $('.propriety-setter', input).attr('disabled', true);

        $('input', input).appendTo(holder);

        holder.append(checkH);

        input.append(holder);
    };

    GEN.getPageJSON = function (id, callback) {
        const link = GEN.UTILS.link_get_page_json || 'red.form_designer_db.load_form?p_id=';
        let req = null;
        const action = $.grep(GEN.DETAILS.linkPageList, function (p, e) {

            return p.page === id;

        })[0];

        const app = action && action.app ? action.app : '';

        if (id) {

            req = $.getJSON(link + id + '&p_app=' + app, function (data) {

                if (data) {

                    const containers = GEN.layout.getAllContainers(data.rows);


                    if (callback)

                        callback(containers, data);

                } else {

                    if (callback)

                        callback([], data);

                }


            }).fail(function () {
                console.log('fail');
                callback([]);
            });

        }

        return req;
    }
    //setContainerCopyOptions
    const setContainerCopyOptions = function (object) {
        const pageSelect = $(VARS.html.pageCopySelecter);
        const cList = $(VARS.html.pageCopyContainerList);

        pageSelect[0].onContainersSet = function () {
        };

        pageSelect.append('<option value=""></option>');

        GEN.DETAILS.linkPageList.forEach(function (page) {
            const option = '<option value="' + page.page + '">' + page.description + '</option>';
            pageSelect.append(option);
        });

        pageSelect.on('change', function () {

            const container = GEN.edit.object;
            const id = $(this).val();

            $(VARS.html.pageCopyContainerList).html('');

            if (container && container.genType === 'container' && id) {

                GEN.getPageJSON(id, function (containers, data) {
                    if (containers[0]) {
                        containers.forEach(function (c) {

                            if (c.proprieties.type === container.GET.type()) {
                                const copy = $('<div class="radio">' +
                                    ' <label>' +
                                    '<input type="radio" name="gen-c-copy" value="' + c.proprieties.tag + '" class="radiolist" />' +
                                    '<span>' + c.proprieties.tag + '</span>' +
                                    '</label>' +
                                    '</div>');

                                copy.on('change', function () {
                                    GEN.edit.copyData = data.plsql;
                                    GEN.edit.copyProperties = c;
                                    return false;
                                });

                                cList.append(copy)
                            }
                        });
                        pageSelect[0].onContainersSet();
                    }
                });
            }

        });
    };

    GEN.getSetter = function (p) {
        const type = p.type;
        const propriety = p.propriety;
        const object = p.object;

        const objectProperties = object.getPropertyOptions && object.getPropertyOptions(propriety) ? object.getPropertyOptions(propriety) : null;
        const pLabel = object.propertiesLabels[propriety] ? object.propertiesLabels[propriety] : capitalizeFirstLetter(propriety);
        let size = objectProperties && objectProperties.size ? objectProperties.size : object.proprieties[p.propriety].size ? object.proprieties[p.propriety].size : '6';
        //objectProperties.size ? size = objectProperties.size :
        const attrsObj = object.propertiesOptions && object.propertiesOptions[propriety] && object.propertiesOptions[propriety].attrs ? object.propertiesOptions[propriety].attrs : {};
        let attrsStr = "";

        const setOnConfirm = !(objectProperties && objectProperties.setOnConfirm === false);
        const setterClass = setOnConfirm ? VARS.edition.class.propSetter : '';


        for (let a in attrsObj) {
            attrsStr += ' ' + a + '="' + attrsObj[a] + '" '
        }

        if (type === 'checkbox')
            size = '3';

        const _class = object.proprieties[p.propriety].class ? object.proprieties[p.propriety].class : '';

        const holder = $('<div ' + attrsStr + ' rel="' + propriety + '" item-name="edit-' + propriety + '" class="form-group col-md-' + size + ' ' + _class + ' col-xs-12"></div>');
        const label = $('<label>' + pLabel + '</label>');
        const value = object.GET[propriety] ? object.GET[propriety]() : '';


        switch (type) {
            //OPTIONS / comboboxx
            case 'select':
                const canAdd = objectProperties.canAdd ? ' can-add="true"' : '';
                const addCb = objectProperties.onOptionAdd ? objectProperties.onOptionAdd : function () {
                };
                const multiple = objectProperties && objectProperties.value && objectProperties.value.multiple ? 'multiple="true"' : '';
                const select = $('<select' + canAdd + ' name="edit-' + propriety + '" ' + multiple + ' rel="' + propriety + '" class="form-control ' + VARS.edition.class.propSetter + '"/>');
                const options = typeof object.proprieties[propriety].options === 'function' ? object.proprieties[propriety].options() : object.proprieties[propriety].options;

                const drawOptions = function (ops) {

                    ops.forEach(function (o) {

                        const _label = o.label || o.text || "";

                        const opt = $('<option value="' + o.value + '">' + _label + '</option>');
                        let selected;
                        if (Array.isArray(value))
                            value.forEach(function (v) {
                                if (v === o.value)
                                    opt.attr('selected', true);
                            });
                        else {
                            if (value === o.value)
                                opt.attr('selected', true);
                        }


                        select.append(opt)

                    });

                };

                if (options.then) {

                    options.then(function (data) {

                        if (options.onFinish)

                            drawOptions(options.onFinish(data));

                    })

                } else {

                    drawOptions(options);

                }

                /**/

                holder.append(label);

                holder.append(select);

                break;
            //TRUE / FALSE
            case 'checkbox':
                const checked = value ? ' checked="true"' : '';

                holder.append('<div class="checkbox form-check-offset">' +
                    '<label>' +
                    '<input ' + checked + ' rel="' + propriety + '" class="' + VARS.edition.class.propSetter + ' checker" type="checkbox"/> <span>' + capitalizeFirstLetter(pLabel) + '</span>' +
                    '</label>' +
                    '</div>');
                break;
            //LIST FROM ARRAY / in given template
            case'list':

                const items = object.proprieties[propriety].list.items;
                const iTmpl = object.proprieties[propriety].list.itemTemplate;
                const hasSearcher = !!object.proprieties[propriety].list.searcher;
                const onSelect = object.proprieties[propriety].list.onSelect ? object.proprieties[propriety].list.onSelect : function () {
                };
                const valueKey = object.proprieties[propriety].list.key ? object.proprieties[propriety].list.key : 'value';
                const activeValue = object.GET[propriety] && object.GET[propriety]() ? object.GET[propriety]() : '';
                let searcher = null;
                const listHolder = $('<div class="gen-edition-list-holder"/>');

                if (hasSearcher) {

                    searcher = $('<div class="form-group gen-list-searcher col-md-6"><input class="form-control" type="text" placeholder="Pesquisar"></div>')

                    searcher.on('keyup', 'input', function () {

                        const word = $(this).val();
                        const items = listHolder.find('.gen-list-item-setter');

                        items.addClass('hidden');

                        $.each(items.filter('[value*="' + word + '"]'), function (i, li) {
                            $(li).removeClass('hidden');
                        });

                        if (word.length === 0)
                            items.removeClass('hidden');
                    });
                }

                holder.append([label, searcher, listHolder]);

                if (items && items[0]) {
                    for (let i = 0; i < items.length; i++) {
                        let iStr = iTmpl;
                        for (let k in items[i]) {
                            iStr = iStr.replaceAll('#' + k + '#', items[i][k]);
                        }
                        const itemHolder = $(iStr);

                        itemHolder.attr('value', items[i][valueKey]).addClass('gen-list-item-setter');

                        if (itemHolder.attr('value') === activeValue)
                            itemHolder.addClass('active');

                        itemHolder.on('click', function () {
                            $('.gen-list-item-setter', holder).removeClass('active');
                            $(this).addClass('active');
                            holder.find('.' + VARS.edition.class.propSetter).val($(this).attr('value'));
                            onSelect($(this).attr('value'), this);
                        });

                        listHolder.append(itemHolder);
                    }
                    holder.append('<input type="hidden" value="' + activeValue + '" class="' + VARS.edition.class.propSetter + '" rel="' + propriety + '"/>')
                }
                break;
            //separatorlist
            case 'separatorlist':

                if (GEN.attributes && GEN.attributes.get)

                    var html = GEN.attributes.get({
                        type: type,
                        options: objectProperties,
                        target: object
                    });

                holder.append(html);
                /*console.log('fasdjlfasd')
				*/

                break;

            //formlist attribute

            case 'formlist':

                holder.append(label);

                try {

                    if (objectProperties.value && objectProperties.value.setter) {

                        var setter = object.proprieties[propriety].setter().addClass(setterClass).attr('rel', p.propriety);

                        if (objectProperties.type)

                            setter.attr('type', objectProperties.type || 'custom');

                        holder.append(setter);

                    } else {

                        const objectName = object.GET.tag(),

                            attName = p.propriety,

                            flist = $('<div class="box clean box-table-contents gen-formlist-attr-holder" gen-class="" item-name="gen-' + objectName + '_' + attName + '"><div class="box-body table-box"><table id="gen-' + objectName + '_' + attName + '" class="table table-striped gen-data-table IGRP_formlist " rel="T_gen-' + objectName + '_' + attName + '" data-control="data-gen-' + objectName + '_' + attName + '"><thead></thead><tbody><tr row="0"><input type="hidden" name="p_gen-' + objectName + '_' + attName + '_id" value="" /></tr></tbody></table></div></div>'),

                            fields = objectProperties.fields || false;

                        flist.addClass(setterClass).attr('rel', p.propriety).attr('type', 'formlist');

                        $('.IGRP_formlist', flist).IGRP_formlist({

                            fields: fields,

                            data: object.GET[p.propriety]()

                        });

                        if (objectProperties.sortable)

                            flist.find('tbody').sortable({

                                items: 'tr'

                            }).disableSelection();


                        holder.append(flist)

                    }


                } catch (err) {

                    console.log(err)

                }


                break;

            // CUSTOM SETTER / returns the setter $('<div/>')
            case 'custom':
                holder.append(label);

                try {
                    //console.log(object)
                    var setter = object.proprieties[propriety].setter().addClass(setterClass).attr('rel', p.propriety);

                    if (objectProperties.type)

                        setter.attr('type', objectProperties.type || 'custom');

                    holder.append(setter);

                } catch (e) {
                    console.log(e);
                }

                break;
            case 'event':
                holder.append(label);
                holder.append($('<input rel="' + propriety + '" class="form-control ' + VARS.edition.class.propSetter + '" change-event="' + object.proprieties[propriety].changeEvent + '" value="' + value + '" type="text"/>'));
                break;
            case 'textarea':
                holder.append(label);
                holder.append($('<textarea name="edit-' + propriety + '" rel="' + propriety + '" class="form-control ' + VARS.edition.class.propSetter + '" type="' + type + '">' + value + '</textarea>'));
                break;
            case 'texteditor':

                const id = 'edit-' + propriety + '-' + (new Date()).getTime();

                holder.append(label);
                holder.append($('<textarea id="' + id + '" name="edit-' + propriety + '" rel="' + propriety + '" class="form-control ' + VARS.edition.class.propSetter + '" type="' + type + '">' + value + '</textarea>'));

                setTimeout(function () {

                    $.IGRP.components.form.texteditor({
                        parent: holder,
                        selector: '#' + id
                    });

                }, 100)

                break;
            default:
                holder.append(label);
                holder.append($('<input name="edit-' + propriety + '" rel="' + propriety + '" class="form-control ' + VARS.edition.class.propSetter + '" value="' + value + '" type="' + type + '"/>'));
                break;
        }

        if (objectProperties && objectProperties.help) {
            console.log(holder);
        }

        /*if(propriety == 'tag'){
			$('.propriety-setter',holder).attr('maxlength',8);
		}*/

        return holder;
    }

    GEN.attrsForm = function (object) {
        const checkers = [];
        const formHolder = $(VARS.edition.modal).find('.modal-body [rel="properties"]');

        $(VARS.edition.modal).find('.modal-body [rel="properties"]').html('');

        for (let p in object.proprieties) { // ciclo nas proprieades do elemento

            const objectProperties = object.getPropertyOptions && object.getPropertyOptions(p) ? object.getPropertyOptions(p) : object.propertiesOptions[p] || null;

            //if( object.isEditable(p) && p != 'type' && p != 'name'){


            if (object.isEditable(p) && p !== 'type' && p !== 'name') {

                let input = false;

                let inputType = null;

                if (objectProperties && objectProperties['inputType'])

                    inputType = objectProperties['inputType']

                else

                    switch (typeof object.proprieties[p]) {
                        case 'string':
                            inputType = objectProperties && objectProperties.inputType ? objectProperties.inputType : 'text';
                            break;
                        case 'number':
                            inputType = 'number';
                            break;
                        case 'boolean':
                            inputType = 'checkbox';
                            break;

                        case 'object':

                            if (objectProperties && objectProperties.type && objectProperties.type === 'formlist')
                                inputType = 'formlist';

                            else if (object.proprieties[p].options)
                                inputType = 'select';
                            else if (object.proprieties[p].list)
                                inputType = 'list';
                            else if (object.proprieties[p].setter)
                                inputType = 'custom';
                            else if (object.proprieties[p].changeEvent)
                                inputType = 'event';
                            else if (objectProperties && objectProperties.type && objectProperties.type === 'separatorlist')
                                inputType = objectProperties.type;
                            else
                                inputType = 'text';
                            break;
                    }


                input = GEN.getSetter({
                    type: inputType,
                    propriety: p,
                    object: object
                });

                if (input) {

                    if (p === 'tag') {

                        input.attr('required', 'true');

                        $('.propriety-setter', input).attr('required', 'true')

                        configAutoTagSetter(input, object);

                    }

                    if (inputType === 'checkbox') {

                        checkers.push(input);

                    } else {

                        if (p === 'type_changer') {

                            input.find('label').remove();

                            $('#gen-edition-modal .modal-footer .info.type').html(input);

                        } else {

                            if (objectProperties && objectProperties.order >= 0)
                                formHolder.insertAt(input, objectProperties.order)
                            else
                                formHolder.append(input);
                        }

                    }

                    if (objectProperties && objectProperties.hidden)

                        input.addClass('hidden');


                    if (object.propertiesOptions[p] && object.propertiesOptions[p].onEditionStart)
                        object.propertiesOptions[p].onEditionStart({
                            property: p,
                            value: object.GET[p](),
                            input: input
                        })

                }
            }
        }
        //checkers on bottom
        formHolder.append($('<div class="gen-propreties-checkers-holder"/>').append(checkers))
    }

    GEN.confirmEdition = function (o) {

        const options = $.extend({
            hide: true,
            afterTransform: function () {
            }
        }, o);

        const setters = $(VARS.edition.modal + ' [rel="properties"] .' + VARS.edition.class.propSetter + ', ' + VARS.edition.modal + ' .modal-footer .propriety-setter');

        const __tag = setters.filter('[rel="tag"]');

        const transformer = GEN.edit.object.genType === 'container' ? GEN.edit.object : GEN.edit.object.parent;

        $('.gen-tag-exist-err').remove();

        if (__tag.valid()) {

            if (GEN.tags.valid(__tag.val(), GEN.edit.object)) {

                const styleSetters = $(VARS.edition.modal + ' [rel="style"] .style-setter');

                $.each(setters, function (i, setter) {

                    const type = $(setter).attr('type');

                    const rel = $(setter).attr('rel');

                    let value = null;

                    switch (type) {

                        case 'checkbox':

                            value = $(setter).is(':checked');

                            break;

                        case 'formlist':

                            value = $('.IGRP_formlist', setter)[0]._export();

                            break;

                        case 'attrvalue':

                            value = $(setter).attr('attr-value');

                            break;

                        case 'texteditor':

                            const id = $(setter).attr('id'),

                                val = CKEDITOR.instances[id].getData();

                            value = val;

                            break;

                        default:

                            value = $(setter).val();


                    }

                    /*if(type == 'checkbox')

						value = $(setter).is(':checked');
					else
						value = $(setter).val();*/

                    if (GEN.edit.object && GEN.edit.object.SET[rel])

                        GEN.edit.object.SET[rel](value);


                    //$(document).trigger('gen-edition-confirm', )

                });

                if (GEN.edit.object) {

                    //XSL CHANGES
                    GEN.edit.checkXSLChanges();

                    //STYLE TAB SETTER
                    $.each(styleSetters, function (i, style) {

                        if (GEN.edit.object.customStyle) {
                            const rel = $(style).attr('rel');
                            const value = $(style).val();

                            GEN.edit.object.customStyle[rel] = value;
                        }

                    });

                    //RULES
                    if (GEN.edit.object.formField || $.inArray(GEN.edit.object.type, acceptsRules) !== -1) {

                        const slist = $('#gen-rules-holder.IGRP-separatorlist', $(VARS.edition.dialog))[0];
                        // EDSON 08-03-17 var isTable = GEN.edit.object.parent.type == 'formlist' || GEN.edit.object.parent.type == 'separatorlist' ? true : false;
                        const isTable = GEN.edit.object.parent.type === 'table' || GEN.edit.object.parent.type === 'formlist';


                        const rule = slist.toJSON({
                            excludeNamePrefix: 'gen_rule_',
                            params: {
                                isTable: isTable
                            }
                        });

                        GEN.edit.object.setRules(rule);
                        //var rulesDataArr = $('.gen-properties-setts-holder[rel="rules"] #gen-rules-table input:not(.sl-row-id)').serializeArray();
                        //GEN.edit.object.setRules(rulesDataArr);
                    }

                    //copy options
                    if (GEN.edit.object.genType === 'container') {
                        const pageSelect = $(VARS.html.pageCopySelecter);
                        const checked = $('[name="gen-c-copy"]:checked');

                        const copyOptions = pageSelect.val() && checked[0] ? {
                            id: pageSelect.val(),
                            container: checked.val(),
                            description: $('option[value="' + pageSelect.val() + '"]', pageSelect).text(),
                            settings: GEN.edit.copyProperties,
                            plsql: GEN.edit.copyData
                        } : false;

                        GEN.edit.object.copy(copyOptions);

                    }
                    //tabs and boxes - have containers inside
                    if (GEN.edit.object.contents)

                        setHtmlStyle(GEN.edit.object);

                    if (GEN.edit.object.onEditionConfirm)

                        GEN.edit.object.onEditionConfirm(GEN.edit.object);

                }


                transformer.Transform({

                    callback: options.afterTransform

                });

                /*if(GEN.edit.object && ( GEN.edit.object.genType == 'container' || GEN.edit.object.genType == 'html') )
					GEN.edit.object.Transform();
				else
					GEN.edit.object.parent.Transform();*/

                $(document).trigger('gen-' + GEN.edit.object.genType + '-edition-confirm', [GEN.edit.object]);

                if (options.hide)

                    $(VARS.edition.modal).modal('hide');


            } else {
                __tag.parent().prepend('<label for="edit-tag" generated="true" class="error form-validator-label gen-tag-exist-err">Tag existente!</label>')

                $('#gen-edition-modal').scrollTop(0);
            }
        } else {

            $('#gen-edition-modal').scrollTop(0);
        }

        return false;


    }

    GEN.edit = function (object, p) {

        const modal = $(VARS.edition.modal);
        const genType = object.genType;
        const type = object.GET.type();
        const id = object.GET.id();
        const options = p ? p : {};
        const initialPosition = object.position !== undefined && object.position !== -1 ? object.position : object.order;

        GEN.edit.object = object;

        GEN.edit.copyProperties = null;

        GEN.edit.copyData = null;

        //style config : if container hasTableRows, ID style is disabled
        const fieldsRepeat = genType === 'field' ? object.parent.hasTableRows : false;

        //fields type change
        if (genType === 'field' && isTypeChangeble(object.type))

            object.setPropriety({
                name: 'type_changer',
                label: 'Type',
                value: {
                    value: object.type,
                    options: function () {
                        const rtn = [];

                        GEN.getDeclaredFields().forEach(function (_f) {
                            if (object.parent.validField(_f.type))
                                rtn.push({value: _f.type, label: capitalizeFirstLetter(_f.type)})
                        });

                        return rtn;
                    }()
                },
                onChange: function (v) {

                    if (v !== object.type) {

                        const dfield = GEN.getDeclaredField(v),

                            nfield = new dfield.field(v, {
                                properties: null,
                                style: object.customStyle,
                                options: {
                                    rules: object.rules || null
                                }
                            }),

                            nprop = {};

                        nfield.order = initialPosition;

                        console.log(initialPosition)

                        object.parent.SET.field(nfield, function () {

                            for (let p in nfield.proprieties) {

                                if (p in object.proprieties) {

                                    nfield.proprieties[p] = object.proprieties[p];

                                }

                            }

                            object.parent.removeField(object.id, false, true, function () {
                            });


                        });

                    }

                }
            });

        //table fields do not have ID's (because they repeat)
        if (fieldsRepeat) {
            object.customStyle.id = '';
            $('.style-setter[rel="id"]', modal).attr('disabled', true);
        }

        modal.attr('gen-type', genType);

        modal.attr('object-type', type);

        modal.attr('object-id', id);

        if (object.parent)

            $('.modal-footer .info.parent', modal).text(object.parent.GET.tag()).show();

        $('.modal-footer .info.object', modal).text(object.GET.tag()).show();

        $('.modal-footer .info.type', modal).text(object.GET.type()).show();

        if (GEN.edit.object.xslOptions)

            $('#use-default-xsl').prop('checked', GEN.edit.object.xslOptions.useDefault);

        if (GEN.edit.object.customStyle)
            for (let s in GEN.edit.object.customStyle) {
                $('.style-setter[rel="' + s + '"]', modal).val(GEN.edit.object.customStyle[s]);
            }

        //COPY CLEAR
        $(VARS.html.pageCopyContainerList).html('');

        if (genType === 'container') {
            if (GEN.edit.object.copyOptions) {
                //$(VARS.html.pageCopyContainerList).html('');
                $(VARS.html.pageCopySelecter)[0].onContainersSet = function () {
                    const radio = $(VARS.html.pageCopyContainerList).find('input[value="' + GEN.edit.object.copyOptions.container + '"]');
                    radio.prop('checked', true);
                    radio.trigger('change');
                }

                $(VARS.html.pageCopySelecter).select2('val', GEN.edit.object.copyOptions.id);
            }
        }

        GEN.attrsForm(object);

        if (object.onEditionStart)
            object.onEditionStart();

        GEN.edit.configXSLData();

        if (options.tab)
            $(modal.find('.modal-header > ul > li[rel="' + options.tab + '"]')[0]).click()
        else
            $(modal.find('.modal-header > ul > li')[0]).click();

        $('select', modal).select2();

        /*$('select',modal).each(function(i,s){

			var o   = {},

				rel = $(s).attr('rel');

			if($(s).attr('can-add') == 'true')

				o.tags = true;

			$(s).select2(o).on("select2:select", function (e) {

				if(rel && GEN.edit.object.propertiesOptions[rel]){

					var options = GEN.edit.object.propertiesOptions[rel].value ? GEN.edit.object.propertiesOptions[rel].value.options : GEN.edit.object.propertiesOptions[rel].propriety.options,

						found   = false;

					for(var i = 0; i < options.length; i++) {
					    if (options[i].value == e.params.data.id) {
					        found = true;
					        break;
					    }
					}

					if(!found)
						options.push({
							value : e.params.data.id,
							label : e.params.data.id,
							attributes : [
								{ name : 'action', value :false },
								{ name : 'app', value :false },
								{ name : 'page', value :false },
								{ name : 'link', value :e.params.data.id },

							],
							custom : true
						});

				}

			});

		})*/

        /*FORM FIELD RULES SET/ SHOW/HIDE*/
        if (object.formField || $.inArray(object.type, acceptsRules) !== -1)

            GENRULES.setTargets(object, GEN);

        else

            $('.modal-header ul li[rel="rules"]', modal).hide();


        $(document).trigger('gen-edition', [{object: object}]);

        $(document).trigger('gen-' + genType + '-edition', [object]);

        $(document).trigger('gen-edition-show', {
            onEdition: object,
            modal: modal
        });

        $(document).on('change', 'select[name="edit-type_changer"]', function () {
            GEN.openIgrpDoc($(this).val());
        });

        GEN.edit.show();
    }

    GEN.edit.XSLEditor = null;

    GEN.edit.saveChanges = function (v) {
        const object = GEN.edit.object;
        //var template = object.template ? object.template : object.templates;
        //console.log( GEN.edit.XSLEditor )
        //object.customTemplate = v;

        //console.log(object)
    }

    $('#use-default-xsl').on('change', function () {
        const isChecked = $(this).is(':checked');

        $('#gen-edit-xsl').attr('use-default', isChecked)
        //console.log(isChecked)
        if (isChecked) {
            //GEN.edit.XSLEditor.set
        }

        //GEN.edit.object.xslOptions.useDefault = isChecked;

        ///GEN.edit.XSLEditor.options.readOnly = isChecked;
        /*if(GEN.edit.XSLEditor.options.readOnly)
			GEN.edit.XSLEditor.options.readOnly = false;
		else
			GEN.edit.XSLEditor.options.readOnly = true;

		console.log(GEN.edit.XSLEditor.options.readOnly)*/
    });

    GEN.edit.checkXSLChanges = function () {
        const object = GEN.edit.object;
        const template = object.template ? object.template : object.templates;
        const isChecked = $('#use-default-xsl').is(':checked');

        object.xslOptions.useDefault = isChecked;

        if (!isChecked)
            object.xslOptions.template = GEN.edit.XSLEditor.getValue();
        else
            object.xslOptions.template = false;


    };

    GEN.edit.setXSLValue = function (template) {

        const modal = $(VARS.edition.modal);

        const hasManyTemplates = GEN.edit.object.templates ? Object.keys(GEN.edit.object.templates).length > 1 : false;

        if (template && !hasManyTemplates) {

            $(modal.find('ul li[rel="xsl"]')).show();

            GEN.edit.XSLEditor.setValue(template);

            GEN.edit.XSLEditor.autoFormatRange({line: 0, ch: 0}, {line: GEN.edit.XSLEditor.lineCount()});

            codeEditorView(true);

            setTimeout(function () {

                GEN.edit.XSLEditor.refresh();

            }, 400);

        } else {
            $(modal.find('ul li[rel="xsl"]')).hide();
        }

    }

    GEN.edit.configXSLData = function () {

        const modal = $(VARS.edition.modal);

        const template = GEN.edit.object.XSLToString();
        //var template = GEN.edit.object.template ? GEN.edit.object.XSLToString() : GEN.edit.object.templates[Object.keys(GEN.edit.object.templates)[0]];

        $('.object-xsl-templates', modal).hide().html('');

        GEN.edit.setXSLValue(template);

        $('#gen-edit-xsl').attr('use-default', GEN.edit.object.xslOptions.useDefault)
        /*if(typeof template == 'object'){

			if(Object.keys(template).length > 1){
				for(var t in template){
					$('.object-xsl-templates').show().append('<option value="'+t+'">'+t+'</option>');
				}
			}

			GEN.edit.setXSLValue( template[Object.keys(template)[0]] )

		}else{
			GEN.edit.setXSLValue(template);
		}*/

    };

    GEN.edit.show = function () {
        const modal = $(VARS.edition.modal);
        modal.modal('show');

        const first = modal.find('.' + VARS.edition.class.propSetter + ':not([type="checkbox"]):not(select)')[0];

        if (first) {

            //$('.propriety-setter[rel="label"]').trigger('keyup');

            setTimeout(function () {
                first.select();
            }, 500);
        }

    }

    GEN.edit.hide = function () {
        const modal = $(VARS.edition.modal);
        const rseparatorlist = $('[rel="rules"] .IGRP-separatorlist', modal)[0];
        GEN.edit.XSLEditor.setValue('');

        codeEditorView(false);

        setTimeout(function () {
            GEN.edit.XSLEditor.refresh();
        }, 400);

        $('#content[rel="gen-contents-holder"]').removeClass('editing');

        $(VARS.edition.holder).removeClass('active');

        $(VARS.edition.modal).find('.modal-body [rel="properties"]').html('');

        $(VARS.edition.dialog).attr('gen-type', '');
        $(VARS.edition.dialog).attr('object-type', '');
        $(VARS.edition.dialog).attr('object-id', '');

        $('.modal-footer .info', modal).hide();

        $('.modal-footer .info.parent', modal).text('');

        $('.modal-footer .info.object', modal).text('');

        $('.modal-footer .info.type', modal).text('');

        $('.modal-header ul li[rel="rules"]', modal).hide();

        rseparatorlist.resetAll();

        /* style*/

        $('.style-setter', modal).val('');

        $('.style-setter[rel="id"]', modal).removeAttr('disabled');

        //copy
        $(VARS.html.pageCopySelecter).select2('val', '');
        $(VARS.html.pageCopyContainerList).html('');

        GEN.edit.copyProperties = null;
        GEN.edit.copyData = null;

        xslEditing = false;
        if (GEN.edit.object) {

            if (GEN.edit.object.proprieties && GEN.edit.object.proprieties.type_changer)

                delete GEN.edit.object.proprieties.type_changer;

        }
        setTimeout(function () {
            GEN.edit.object = null;
        }, 150);


    }

    GEN.templates = {
        container: {},
        field: {},
        set: function (p) {
            //if(!GEN.templates[p.genType][p.name]){
            const object = GEN.templates[p.genType][p.name] ? GEN.templates[p.genType][p.name] : GEN.templates[p.genType][p.name] = {};

            if (p.template)
                object.template = p.template;

            if (p.fieldTemplate)
                object.field = p.fieldTemplate;

            if (p.container && p.fieldContainerTemplate)
                object[p.container] = p.fieldContainerTemplate;

        },
        get: function (p) {
            return GEN.templates[p.genType][p.name]
        }
    }


    GEN.getAllContents = function () {
        const rtn = [];

        $.each($('.gen-container-holder'), function (i, c) {
            const id = $(c).attr('id');
            const container = GEN.getContainer(id);
            if (container) {
                rtn.push({
                    container: container,
                    fields: container.GET.fields()
                });
            }
        });

        return rtn;
    }

    GEN.getAllFields = function () {
        let rtn = [];
        CONTAINERS.forEach(function (c) {
            rtn = rtn.concat(c.GET.fields())
        });
        return rtn;
    }

    GEN.getAllFieldsAndMenus = function () {

        let rtn = [];

        CONTAINERS.forEach(function (c) {

            rtn = rtn.concat(c.GET.fields())

            if (c.contextMenu)

                rtn = rtn.concat(c.contextMenu.getFields())
        });

        return rtn;
    };

    GEN.getFieldByTag = function (tag) {

        const fields = GEN.getAllFieldsAndMenus();
        let rtn = null;

        for (let i = 0; i < fields.length; i++) {

            const field = fields[i];

            if (field.GET.tag() === tag) {
                rtn = field;
                break;
            }

        }

        return rtn;

    }

    GEN.getFieldByAttr = function (attr, value) {
        let rtn = false;
        const fields = GEN.getAllFields();
        for (let i = 0; i < fields.length; i++) {
            const f = fields[i];
            if (f.GET[attr] && f.GET[attr]() === value) {
                rtn = f;
            }
        }
        return rtn;
    }
    GEN.getFieldsPreservedCodes = function (mode, part) {

        const rtn = [];

        GEN.getAllFieldsAndMenus().forEach(function (f) {

            if (f.server.preserved[mode] && f.server.preserved[mode][part]) {

                rtn.push(f);

            }

        });

        return rtn;

    }
    GEN.getFieldsIncludes = function () {
        const rtn = {};
        const idx = 0;
        const ctrl = {};
        GEN.getContainers().forEach(function (c, ci) {
            //console.log(c);
            if (c.GET.fields) {
                c.GET.fields().forEach(function (f, fi) {
                    const type = f.type;
                    //console.log(f.type.toUpperCase());
                    //console.log(f.includes)
                    if (f.includes && (f.includes.css || f.includes.js || f.includes.xsl)) {

                        if (!rtn[type])
                            rtn[type] = {
                                xsl: [],
                                css: [],
                                js: []
                            }
                        //else


                        for (i in f.includes) {
                            rtn[type][i] = $.merge(rtn[type][i], f.includes[i]);
                        }
                    }
                });
            }
        });
        //console.log(rtn)
        return rtn;
    }

    GEN.getContainersIncludes = function () {
        const rtn = {};
        const idx = 0;
        const ctrl = {};

        GEN.getContainers().forEach(function (c) {
            const type = c.type;
            if (c.includes && (c.includes.css || c.includes.js || c.includes.xsl)) {
                if (!rtn[type])
                    rtn[type] = {
                        xsl: [],
                        css: [],
                        js: []
                    }

                for (i in c.includes) {
                    rtn[type][i] = $.merge(rtn[type][i], c.includes[i]);
                }

            }
        });

        //console.log(rtn)

        return rtn;
    }

    /*GEN.getAllFieldsType = function(){
		var rtn  = [];
		var idx  = 0;
		var ctrl = {};

		GEN.getContainers().forEach(function(c){
			c.GET.fields().forEach(function(f){
				if(!ctrl[f.GET.type()]){
					rtn.push(f);
					idx++;
					ctrl[f.GET.type()] = true;
				}
			});
		});

		return rtn;
	}

	GEN.getAllContainersType = function(){
		var rtn = new Array();
		var idx = 0;
		var ctrl = {};

		GEN.getContainers().forEach(function(c){
			if(!ctrl[c.GET.type()]){
				rtn.push(c);
				idx++;
				ctrl[c.GET.type()] = true;
			}
		});

		return rtn;
	}*/


    GEN.writeCode = function () {
        let rtn;
        let content = GEN.baseXSL.top;

        CONTAINERS.forEach(function (container) {
            content = content + container.genXSL();
        });

        content = content + GEN.baseXSL.bottom;

        rtn = content;

        return rtn;
    }

    GEN.on = function (ev, callback) {
        switch (ev) {
            case 'dialog-edition-hide':

                break;

            case 'view-change':
                viewChangeEvents.push(callback);
                break;

            case 'init':
                initEvents.push(callback);
                break;
            case 'ready':
                readyEvents.push(callback);
                break;
        }
    }

    const executeEvents = function (evs, param) {
        try {
            evs.forEach(function (ev) {
                ev(param);
            });
        } catch (e) {
            console.log(e);
        }
    };

    const _import = function (op) {
        if (op) {
            $('body').addClass('importing');
            //GEN.onImportStart();
        } else {
            $('body').removeClass('importing');
            //GEN.onImportEnd();
        }
        GEN.importing = op;
    };

    const strToJson = function (str) {
        rtn = false;
        try {
            rtn = $.parseJSON(str);
        } catch (e) {
            _import(false);
            console.log('invalid json:');
            console.log(str);
            GEN.layout.addRow({index: 0})
        }
        return rtn;
    };

    GEN.import = function (data, _p) {

        var arr = [];

        let json = typeof data == 'string' ? strToJson(data) : data;

        if (!json.rows) {
            const rows = json;
            json = {
                rows: rows
            }
        }

        if (json) {

            GEN.files = json.files || {
                css: [],
                js: [],
                xsl: []
            };

            //draw page rows
            if (json.rows && json.rows[0]) {

                removeAllContainers();
                //css value
                if (json.css) {
                    GEN.cssEditor.setValue(json.css);
                    setCustomCSStoView();
                }

                if (GEN.files.css[0]) {

                    GEN.files.css.forEach(function (f) {

                        GEN.includeToHead({
                            type: 'css',
                            path: GEN.getIncludeURL(f.file)
                        });

                    });

                }

                if (json.js) {
                    GEN.jsEditor.setValue(json.js);
                    setCustomJStoView();
                }

                if (GEN.files.js[0]) {

                    GEN.files.js.forEach(function (f) {

                        GEN.includeToHead({
                            type: 'js',
                            path: GEN.getIncludeURL(f.file)
                        });

                    });

                }

                //js value
                //set here
                //console.log(json.rows);

                var arr = GEN.addContainersPerRow(json.rows);

                GEN.dropContainers_ROW(arr, {

                    callback: function () {

                        if (_p && _p.callback) _p.callback();

                        $(window).resize();

                        GEN.done();

                        _import(false);
                    }
                });

            } else {

                const startCb = function () {
                    GEN.done();

                    _import(false);

                    if (_p && _p.callback) _p.callback();

                };

                if (json && (!json.rows || !json.rows[0])) {

                    const row = GEN.layout.addRow({index: 0});

                    const PageTitleComponent = {
                        name: 'sectionheader',
                        row: row,
                        column: row.find('>.gen-column'),
                        index: 0,
                        holder: GEN.getItemBeforeDrop('sectionheader'),
                        params: {
                            genType: 'container',
                            proprieties: {
                                text: GEN.DETAILS.action_descr,
                                isTitle: true
                            }
                        }
                    };


                    GEN.dropContainers_ROW([PageTitleComponent], {
                        callback: function () {
                            row.find('>.gen-column').attr('empty', 'true').addClass('distance-bottom');
                            startCb();
                        }
                    });

                } else {
                    startCb();
                }


            }

            if (json.plsql)
                for (let p in json.plsql) {

                    if (p === 'gentype' && !json.plsql[p])

                        json.plsql[p] = GEN.SETTINGS.gentype;

                    GEN.SETTINGS.SET(p, json.plsql[p]);
                }

            if (json.service) {

                GEN.service.set(GEN);

                GEN.SET.service({
                    desc: json.service.desc,
                    code: json.service.code,
                    proc: json.service.proc,
                    connectionsReq: json.service.connectionsReq,
                    connectionsRes: json.service.connectionsRes,
                    fieldsReq: json.service.fieldsReq,
                    fieldsRes: json.service.fieldsRes
                });

            }

            $('#igrp-form-gen').trigger('on-import', [json]);
        }
    }

    GEN.addContainersPerRow = function (rows, parent) {
        const arr = [];

        rows.forEach(function (_row, index) {

            GEN.layout.addRow({
                index: index,
                columns: _row.columns,
                parent: parent ? parent : false,
                class: _row.propreties && _row.propreties.class ? _row.propreties.class : '',
                callback: function (p) {

                    p.columns.forEach(function (c) {

                        c.containers.forEach(function (params, containerIndex) {
                            const name = params.proprieties.type;
                            const container = {
                                name: name,
                                params: params,
                                row: p.row,
                                column: c.html,
                                index: containerIndex,
                            };

                            arr.push(container);
                        });
                    });
                }
            });
        });

        return arr;
    }

    GEN.export = function () {
        //console.log(GEN.cssEditor.getValue().replaceAll(' ',''))
        const page = {
            rows: GEN.layout.getRows(),
            plsql: GEN.SETTINGS.toJson(),
            css: GEN.cssEditor.getValue(),
            js: GEN.jsEditor.getValue(),
            files: GEN.files,
            service: GEN.proprieties.service
        };
        //console.log(page);
        //console.log(JSON.stringify(page));

        $('#igrp-form-gen').trigger('on-export', [page]);

        return JSON.stringify(page);
    }

    GEN.getDefaultIncludesStr = function (relative) {

        let rtn = "";

        const xslTmplPath = GEN.SETTINGS.gentype === 'java' ? '../../..' : '../..';

        const iPath = relative ? xslTmplPath : path;

        GEN.defaultIncludes.forEach(function (name) {

            rtn += '<xsl:include href="' + iPath + '/xsl/tmpl/IGRP-' + name + '.tmpl.xsl?v=' + version + '"/>';

        });

        if (GEN.files.xsl[0]) {

            GEN.files.xsl.forEach(function (x) {
                rtn += '<xsl:include href="' + iPath + '/xsl/tmpl/' + x.file + '?v=' + version + '"/>';
            });
        }


        return rtn;
    }

    GEN.includeTemplates = function (names) {
        const idx = GEN.baseXSL.bottom.indexOf('</xsl:stylesheet>');
        const iPath = path;

        names.forEach(function (name) {
            const tmpl = '<xsl:include href="' + iPath + '/xsl/tmpl/IGRP-' + name + '.tmpl.xsl?v=' + version + '"/>';

            if (!isIncluded(name)) {
                GEN.XSL.find('stylesheet').append(tmpl);
                TMPL_INCLUDES.push(name);
            }
        });
    }

    GEN.getIncludedTemplatesStr = function (relative) {
        let rtn = "";
        const iPath = path;

        const xslTmplPath = GEN.SETTINGS.gentype === 'java' ? '../../..' : '../..';

        const includStr = relative ? xslTmplPath : iPath;

        TMPL_INCLUDES.forEach(function (tmpl) {
            rtn = rtn + '<xsl:include href="' + includStr + '/xsl/tmpl/IGRP-' + tmpl + '.tmpl.xsl?v=' + version + '"/>';
        })
        return rtn;
    }

    const isHeadIncluded = function (path) {
        let rtn = false;

        if (GEN.baseXSL.top.indexOf(path) !== -1) rtn = true;

        return rtn;
    };

    const setToBaseXslHeader = function (path) {
        const idx = GEN.baseXSL.top.indexOf('</head>');
        if (!isHeadIncluded(path)) {
            //GEN.baseXSL.top = GEN.baseXSL.top.insert(idx,path);
        }
    };

    const includeToHead = function (p) {

        const relative = p.relative !== false;

        const link = relative ? '{$path}' + p.path : p.path;

        const media = p.media ? 'media="' + p.media + '"' : '',
            charset = p.charset ? 'charset="' + p.charset + '"' : '';

        const xslInclude = p.type === 'css' ? '<link ' + media + ' rel="stylesheet" type="text/css" href="' + link + '"/>' :
            p.type === 'js' ? '<script ' + charset + ' type="text/javascript" src="' + link + '"></script>' : null;

        let viewLink = p.path;

        if (!relative && p.path.indexOf('{$path}') === 0)
            viewLink = path + p.path.split('{$path}').pop();

        if (viewLink.indexOf('{$path}') >= 0)
            viewLink = viewLink.replace('{$path}', path);

        const viewInclude = p.type === 'css' ? '<link media="' + media + '" rel="stylesheet" type="text/css" href="' + viewLink + '?v=' + version + '"/>' :
            p.type === 'js' ? '<script ' + charset + ' type="text/javascript" src="' + viewLink + '?v=' + version + '"></script>' : null;

        //include css to the GEN VIEW
        if (!GEN.viewFileIncluded(viewLink, p.type)) {

            if (p.type === 'css')
                $(viewInclude).insertBefore($('style#custom-css'));

            else
                $('html head').append(viewInclude);
            /*var script  = document.createElement('script'),
                head    = document.getElementsByTagName('head')[0];
            script.type = 'text/javascript';
            script.src  = viewLink;
            head.appendChild(script);*/
        }

        //$('html head').append(viewInclude);
    };

    GEN.includeToHead = function (p) {
        /*
			type     : 'css/js'
			relative : true/false - path relative to IGRP structure
			path     : 'path to the file',
		*/
        if (p[0])
            p.forEach(function (include) {
                includeToHead(include);
            })
        else
            includeToHead(p);
    }

    GEN.isHeadIncluded = function (path) {
        return GEN.viewFileIncluded(path, 'css');
    }

    GEN.viewFileIncluded = function (path, type) {
        let rtn = false;

        const viewFiles = type === 'css' ? $('link[rel="stylesheet"]') : $('script');
        const attrName = type === 'css' ? 'href' : 'src';

        for (let i = 0; i < viewFiles.length; i++) {
            const link = $(viewFiles[i]);
            const vpath = link.attr(attrName);

            if (vpath && vpath.indexOf(path) !== -1) {
                rtn = true;
                break;
            }
        }

        return rtn;
    }

    const decodeHTML = function (s) { // e.g. using jQuery
        return $('<div>' + s + '</div>').text();
    };


    const getActiveEditor = function () {
        const active = $('#gen-views-ctrl li.active').attr('rel');
        const editorName = active.split('gen-').pop();
        const editor = GEN[editorName + 'Editor'];

        return editor;
    };

    const getActiveEditorName = function () {
        const active = $('#gen-views-ctrl li.active').attr('rel');
        const editorName = active.split('gen-').pop();

        return editorName;
    };

    const getEditorType = function () {
        const active = $('#gen-views-ctrl li.active').attr('rel');
        let editorName = active.split('gen-').pop();

        if (editorName === 'plsql')
            editorName = 'sql';

        return editorName;
    };


    GEN.showEditorsErrors = function (jsonRes, type) {
        if (jsonRes.errors) {

            for (let file in jsonRes.errors) {

                const partErrors = jsonRes.errors[file],

                    part = file.split('.java').join(''),

                    menu = $('.list-group-item.server-transform[file-name="' + file + '"]'),

                    menuType = menu.attr('part'),

                    editor = $('.server-editor[editor-part="' + menuType + '"]'),

                    errorsW = $('<div class="gen-editor-errors col-sm-10"><div class="btn btn-default btn-sm gen-editor-errors-close" onclick="__GEN.removeEditorsErrors(true)"><i class="fa fa-times"></i></div><table><tbody/></table></div>');

                editor.addClass('has-error');

                menu.addClass('has-error');
                //console.log(menu);

                partErrors.forEach(function (err) {

                    //console.log(GEN.server.activeMenu)

                    GEN.server.activeMenu.editor.addLineClass((err.line * 1) - 1, 'gutter', 'has-' + type);

                    errorsW.find('tbody').append(
                        '<tr line="' + err.line + '"><td class="gen-editor-err-line">' + err.line + '</td><td class="gen-editor-err-desc">' + err[type] + '</td></tr>'
                    );

                });

                editor.append(errorsW);

                GEN.server.activeMenu.editor.refresh();
            }
        }

    }

    GEN.removeEditorsErrors = function (resize) {

        $('.gen-editor-errors').remove();

        $('.server-editor').removeClass(function (index, css) {
            return (css.match(/\bhas-\S+/g) || []).join(' ');
        });

        $('.server-transform').removeClass(function (index, css) {
            return (css.match(/\bhas-\S+/g) || []).join(' ');
        });

        $('.CodeMirror-gutter-wrapper').removeClass(function (index, css) {
            return (css.match(/\bhas-\S+/g) || []).join(' ');
        });

        if (resize)

            GEN.resizeCodeMirrorArea();
    }

    GEN.getItemBeforeDrop = function (type, genType) {
        const gType = genType ? genType : 'container';

        return HTML({
            tag: 'li',
            name: type,
            type: type,

            //type:gType,
            class: 'gen-declared-' + gType + 's'
        });
    }

    const configDroppedItem = function (item) {
        item.removeAttr('style');
    };

    var getConfigData = function () {
        if (genparams.configURL) {
            $.ajax({
                url: genparams.configURL,
                success: function (configData) {
                    configDataSet = true;

                    GEN.UTILS = typeof configData == 'string' ? $.parseJSON(configData) : configData;

                    //loadDomains();

                    loadPageContents({source: genparams.dataSrc});
                }
            })
        }

    }

    var getBaseXSL = function () {//GET PAGE BASE XSL

        $.ajax({

            url: GEN.path + '/util/base.xsl',

            success: function (base, e, d) {

                //var xmlString = (new XMLSerializer()).serializeToString(base);

                const xmlString = d.responseText;

                const parts = xmlString.split('<!--SPLIT-->');

                GEN.XSL = $(xmlString);

                GEN.baseXSL = {
                    top: parts[0],
                    main: '',
                    bottom: parts[1]
                }

                GEN.includeTemplates(['home-include', 'slide-menu']);

                configCodeEditor();

                configPLSQLEditor();

                //configJAVAEditor();

                baseXslSet = true;

                loadPageContents({source: genparams.dataSrc});

                //if(json && json[0]) GEN.import();
            }
        })
    }

    const transformXMLtoJson = function (data, callback) {
        //console.log(data);
        if (data && callback) {
            callback($(data).to2DOT2());
        }
    };

    const setNewGenPage = function (p) {
        setPageTitle(p.title);
        setPageId(p.id);
        $('#gen-apps-holder li a').removeClass('selected');
        $('#gen-apps-holder li a[idobj="' + p.id + '"]').addClass('selected');
    };


    const loadDomains = function (cback) {

        let jsonFound = false;

        const setDomains = function (d) {

            GEN.DETAILS.domains = [{
                value: '',
                label: ''
            }];

            d.list.forEach(function (i) {

                GEN.DETAILS.domains.push({
                    value: i,
                    label: i
                });

            });
        };

        $.ajax({
            url: GEN.UTILS.link_domains + GEN.DETAILS.id,
            success: function (d) {

                setDomains(d);

                jsonFound = d;


            },
            complete: function (d) {

                if (!jsonFound) {

                    let txt = d.responseText;
                    txt = txt.replaceAll('\t"', '"');
                    txt = txt.replaceAll('\t\t"', '"');
                    txt = txt.replaceAll('  "', '"');
                    txt = txt.replaceAll(' "', '"');

                    setDomains(JSON.parse(txt));

                }

                if (cback)

                    cback();

            }
        })
    };


    GEN.resizeCodeMirrorArea = resizeCodeMirrorArea;


    var setXSLValue = function (cb) {

        const _c = GEN.getXSL({
            removeGenAttrs: true
        });
        //_c = vkbeautify.xml(_c);
        GEN.xslEditor.setValue(_c);

        GEN.xslEditor.autoFormatRange({line: 0, ch: 0}, {line: GEN.xslEditor.lineCount()});

        codeEditorView(true);

        if (cb) cb();

        setTimeout(function () {
            GEN.xmlEditor.refresh();
        }, 200);

        //GEN.setRules();
    }

    var setXMLValue = function (cb) {
        const _c = vkbeautify.xml(GEN.getXML());

        GEN.xmlEditor.setValue(_c);

        codeEditorView(true);

        setTimeout(function () {
            if (cb) cb();
            GEN.xmlEditor.refresh();
        }, 1);

    }

    const replaceSpace = function (e) {
        if (e.find('*')[0])
            $.each(e.find('*'), function (i, el) {
                replaceSpace($(el));
            })
        else
            e[0].textContent = e[0].textContent.replaceAll(' ', '$SPACE$')
    };


    GEN.setPropriety = function (p) {
        if (p.name !== 'type' && p.name !== 'tag') {

            GEN.proprieties[p.name] = p.hasOwnProperty('value') ? p.value : p.propriety;

            if (p.label) GEN.propertiesLabels[p.name] = p.label;

            /* setter */
            const isInt = typeof p.value == 'number';

            GEN.SET[p.name] = function (value, _params) {
                const _value = isInt ? parseInt(value) : value;

                //console.log(p.value)

                if (typeof p.value == 'object')
                    GEN.proprieties[p.name].value = _value;
                else
                    GEN.proprieties[p.name] = _value;
            }
            /* getter */

            GEN.GET[p.name] = function () {
                let rtn;
                if (typeof p.value == 'object') {
                    const hasValueAttr = 'value' in GEN.proprieties[p.name];
                    const val = hasValueAttr ? GEN.proprieties[p.name].value : GEN.proprieties[p.name];
                    rtn = val;
                } else {
                    rtn = GEN.proprieties[p.name];
                }

                return rtn;
            }
        }
    };


    var openPLSQLSettings = function (t) {

        const modal = $('#gen-settings-modal'),

            fields = $('input,select,textarea', modal),

            trnsf = t && typeof t === 'string' ? t : getActiveEditorName(),

            callback = typeof t === 'function' ? t : false,

            objServ = $('div[item-name="page_service"]', modal),

            service = GEN.proprieties.service ? GEN.proprieties.service : {};


        GEN.service.set(GEN);
        objServ.append(GEN.proprieties.service.setter()[0]);

        if (service.code) {

            $('#service_desc', objServ).val(service.desc);
            $('#service_code', objServ).val(service.code);
            $('#service_proc', objServ).val(service.proc);

            GEN.SET.service({
                desc: service.desc,
                code: service.code,
                proc: service.proc,
                connectionsReq: service.connectionsReq,
                connectionsRes: service.connectionsRes,
                fieldsReq: service.fieldsReq,
                fieldsRes: service.fieldsRes
            });

            GEN.service.checkService(GEN, service.code);
        }

        $.each($('.gen-page-setter'), function (i, s) {

            const setter = $(s),
                rel = setter.attr('rel');

            if (setter.attr('type') === 'checkbox')
                setter.prop('checked', GEN.SETTINGS[rel]);
            else
                setter.val(GEN.SETTINGS[rel]);

        });

        modal.attr('transformer', trnsf);

        modal.modal('show');

        modal[0].confirmCallback = callback;

        return false;
    }


//	NOT IN USE -------------------
    const configJAVAEditor = function () {

        CodeMirror.commands.autocomplete = function (cm) {
            CodeMirror.showHint(cm, CodeMirror.hint.anyword);
        };
        /*get editor*/
        GEN.javaEditor = CodeMirror($('#gen-java-view')[0], {
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            mode: "text/x-java",
            extraKeys: {
                "Ctrl-Space": "autocomplete"
            },
            autohint: true,
            lineWrapping: true,
            //lint:true
        });

        GEN.javaEditor.refresh();

        GEN.javaEditor.focus();

        GEN.javaEditor.on('blur', function (cm, change) {

            const m = GEN.server.activeMenu,

                p = GEN.server.preserved;

            if (p[m.mode] && p[m.mode][m.part]) {

                p[m.mode][m.part] = GEN.javaEditor.getValue();

            }
            ;

            //console.log(GEN.javaEditor.getValue());
            //console.log(GEN.server.preserved)

            /*if ( readOnlyLines.indexOf(change.from.line) ) {
                change.cancel();
            }*/
        });

        //var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;

        //CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";

    };

    GEN.getJava = function (callback) {
        if (GEN.javaEditor)

            setPLSQLValue({
                rel: 'gen-java',
                activateBtn: false,
                callback: callback
            });

        //return GEN.javaEditor.getValue();

    };

    GEN.setEditionDialogPosition = function (e) {

        try {
            if (GEN.edit.object) {
                const object = GEN.edit.object;
                const firstInput = $(VARS.edition.dialog + ' #gen-edition-proprieties .proprieties-holder:first-child input');

                GEN.edit.show();
                //$(VARS.edition.holder).addClass('active');

                object.holder.addClass('on-edition');

                object.holder.parents('table').find('#' + object.GET.id()).addClass('on-edition');

                $('#content[rel="gen-contents-holder"]').addClass('editing');

                if (firstInput.attr('type') === 'text' || firstInput.attr('type') === 'number')
                    firstInput[0].select();

                GEN.resizeView();
            }
        } catch (err) {
            GEN.edit.hide();
            console.log(err);
        }
    }

    GEN.setBtnActionAttr = function (field, p) {
        //set options value
        let i;
//var options = [{ value:GEN.DETAILS.page, label:GEN.DETAILS.page_descr }];
        const options = [];
        let value = p.value;
        const tagName = p.tag || 'action';
        const type = p.type || 'text';

        if (GEN.DETAILS.linkPageList && GEN.DETAILS.linkPageList[0])

            GEN.DETAILS.linkPageList.forEach(function (page) {
                options.push({
                    value: page.page.toString(),
                    label: page.description,
                    attributes: [
                        {name: 'app', value: page.app},
                        {name: 'page', value: page.page},
                        {name: 'action', value: page.action},
                        {name: 'link', value: /*GEN.UTILS.link_preview+*/page.link}
                    ]
                });
            });

        const setBTNAction = function (id, object) {
            if (options[0])
                for (let i = 0; i < options.length; i++) {
                    const o = options[i];
                    field.action = {};

                    if (o.value && (id === o.value)) {
                        o.attributes.forEach(function (att) {
                            field.action[att.name] = att.value
                        });

                        if (p.onChange)
                            p.onChange({
                                value: id,
                                params: field.action
                            });

                        break;
                    }


                }
        };

        if (typeof p.value == 'object') {
            for (i = 0; i < options.length; i++) {
                const o = options[i];
                if (o.attributes && o.attributes[0].value === p.value.app && o.attributes[1].value === p.value.page && o.attributes[2].value === p.value.action) {
                    value = o.value;
                    field.proprieties.action = value;
                }
            }
        }

        const params = {
            name: tagName,
            value: {
                value: value ? value : GEN.DETAILS.id,
                options: options,
                type: type
            },
            fieldType: p.fieldType,
            isField: p.isField || false,
            valuePersist: p.valuePersist || false,
            onChange: function (val) {

                var val = field.GET[tagName](),

                    isNum = /^\d+$/.test(val);

                if (isNum) {
                    for (let i = 0; i < GEN.DETAILS.linkPageList.length; i++) {
                        const pg = GEN.DETAILS.linkPageList[i];
                        if (pg.id === val) {
                            val = pg.page;
                            break;
                        }
                    }
                }
                setBTNAction(val);
            }
        };

        if (p.order >= 0)
            params.order = p.order;

        if (p.xmlAttr)
            params.xmlAttr = p.xmlAttr

        field.setPropriety(params);

        if (p.customAction) {

            field.setPropriety({
                name: 'custom_action',
                label: 'Custom Action',
                value: '',
                order: p.order || -1
                //size : 12
            });

            field.setPropriety({
                name: 'action_type',
                label: 'Custom Action',
                value: false,
                onEditionStart: function (o) {

                    const customHolder = $('.gen-properties-setts-holder>[rel="custom_action"]'),

                        actionHolder = $('.gen-properties-setts-holder>[rel="action"]');

                    const checkTypes = function (v) {

                        if (v) {

                            customHolder.show();

                            actionHolder.hide();

                            //customHolder.insertAt(  )

                        } else {

                            customHolder.hide();

                            actionHolder.show();

                        }

                    };

                    o.input.on('change', function () {

                        const value = $(this).find('input').is(':checked');

                        checkTypes(value);

                    });

                    checkTypes(o.value);


                }
            });

        }

        let val = field.GET[tagName](),

            isNum = /^\d+$/.test(val);

        if (isNum) {

            for (i = 0; i < GEN.DETAILS.linkPageList.length; i++) {

                var pg = GEN.DETAILS.linkPageList[i];

                if (pg.id === val) {

                    val = pg.page;

                    break;
                }

            }

        }

        setBTNAction(val);
    }


    GEN.getSrcFields = function (arr) {

        const array = arr && $.isArray(arr) ? arr : ['img', 'iframe'];
        options = [];

        options.push({value: '', label: '-- Fields --'});

        GEN.getContainers().forEach(function (c) {
            if ($.inArray(c.GET.type(), array) !== -1)
                options.push({value: c.GET.tag(), label: c.GET.tag()});

            if (c.GET.type() !== 'table') {
                c.GET.fields().forEach(function (f) {
                    if ($.inArray(c.GET.type(), array) !== -1)
                        options.push({value: f.GET.tag(), label: f.GET.tag()});
                });
            }

            if (c.contents) {
                c.contents.forEach(function (i) {
                    if (i.genType === 'field') {
                        if ($.inArray(c.GET.type(), array) !== -1)
                            options.push({value: f.GET.tag(), label: f.GET.tag()});
                    }
                })
            }
        });

        return options;
    }

    GEN.getDomainValues = function (type, callback) {
        //
        if (type) {

            if (!GEN.domains[type]) {

                const url = GEN.UTILS.link_domains_value + type;

                $('#gen-edit-confirm').attr('disabled', true);

                $.ajax({

                    url: url,

                    success: function (d) {

                        console.log(d)

                        GEN.domains[type] = d;

                    },

                    complete: function () {

                        $('#gen-edit-confirm').removeAttr('disabled');

                        if (callback)
                            callback();

                    }
                })
            } else {

                if (callback)
                    callback();

            }


        }

    };


    /*GEN.setDomainAttr = function(f,p){

		f.setProperty({
			name : 'domain_value',
			editable:false,
			value:'',
			onChange:function(v){
				f.proprieties.domain_value = v;
			}
		});

		f.setProperty({
			name:'domain',
			value:{
				value: p.value || '',
				options:GEN.DETAILS.domains
			},
			onChange:function(v){

				var dval = GEN.domains[v];

				if(dval)
					f.proprieties.domain_value = GEN.domains[v];
				else
					f.proprieties.domain_value = [];

			},
			onEditionStart:function(o){

				var select = $('select',o.input);

				select.on("change", function (e){

					var value  = select.val();

					if(value)

						GEN.getDomainValues( value );

				});

				select.trigger('change');

			}
		});

	};*/

    GEN.setDomainAttr = function (f, p) {

        f.setProperty({

            name: 'domain_value',

            editable: false,

            value: p.selected || '',

            getter: function () {

                return f.proprieties.domain_value

            },

            onChange: function (v) {


                f.proprieties.domain_value = v;

            }
        });

        f.setProperty({
            name: 'domain',
            value: {
                value: p.value || '',
                options: GEN.DETAILS.domains
            },
            onChange: function (v) {

                const dval = GEN.domains[v];

                if (dval) {

                    f.proprieties.domain_value = GEN.domains[v];
                } else {

                    f.proprieties.domain_value = f.proprieties.domain_value || [];
                }

            },
            onEditionStart: function (o) {

                const select = $('select', o.input);

                select.on("change", function (e) {

                    const value = select.val();

                    if (value)

                        GEN.getDomainValues(value);

                });

                select.trigger('change');

            }
        });

    };

    let targetRulesSet = false;

    GEN.removeIncluds = function (arr, t, obj) {
        arr.forEach(function (e) {

            if (obj && obj.includes[t]) {

                obj.includes[t] = obj.includes[t].filter(item => item.path !== e.path);
            }
        });
    };

    const nosicaSignerIncludesFiles = function (field, v) {

        const flIncludes = {
            css: [
                {path: '/plugins/select2/select2.style.css'},
                {path: '/plugins/select2/select2.min.css'},
                {path: '/plugins/virtualkeyboard/vkb.css'}
            ],
            js: [
                {path: '/plugins/nosicaSigner/nosicaSigner.js'},
                {path: '/plugins/select2/select2.init.js'},
                {path: '/plugins/select2/select2.full.min.js'},
                {path: '/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js'}

            ]
        };

        if (v.includes('signer')) {
            flIncludes.js.forEach(function (e) {
                field.includes.js.unshift(e);
            });

            flIncludes.css.forEach(function (e) {
                field.includes.css.unshift(e);
            });

        } else {
            GEN.removeIncluds(flIncludes.js, 'js', field);
            GEN.removeIncluds(flIncludes.css, 'css', field);
        }
    }

    GEN.setTargetAttr = function (field, p) {

        field.setPropriety({
            name: 'target',
            value: {
                value: p.value ? p.value : '_blank',
                options: $.IGRP.defaults.buttons.targets()
            },
            onChange: function (v) {

                if (field.SET.list_source && v !== 'listAssociation')

                    field.SET.list_source('');

                nosicaSignerIncludesFiles(field, v);

            },
            onEditionStart: function (o) {

                const target = field.GET.target ? field.GET.target() : null;

                nosicaSignerIncludesFiles(field, target);

            }

        });

        field.setPropriety({
            label: 'Request Fields',
            name: 'request_fields',
            order: 5,
            value: {
                value: '',
                options: function () {
                    const options = [];
                    GEN.getAllFields().forEach(function (f) {
                        options.push({
                            label: f.GET.label ? f.GET.label() : f.GET.tag(),
                            value: f.GET.name()
                        });
                    });
                    return options;
                },
                multiple: true
            },
            onEditionStart: function (o) {

                const checkTarget = function (v) {
                    const val = v ? v : field.GET.target ? field.GET.target() : null;

                    const target = val || null;

                    if (target === 'remote_call')
                        o.input.show();
                    else
                        o.input.hide();
                };

                $('select[name="edit-target"]').on('change', function () {
                    const target = $(this).val();
                    checkTarget(target);
                });

                checkTarget();

            }
        });

        field.setPropriety({
            label: 'Fields',
            name: 'target_fields',
            value: {
                value: '',
                options: GEN.getSrcFields
            },
            onEditionStart: function (o) {

                if (field.GET.target && (field.GET.target() === "exportall" || field.GET.target() === "changesrc"))
                    o.input.show();
                else
                    o.input.hide();

            }
        });


        const RemoveAssociationFeatures = function (field, list) {

            const parentTag = field.id;

            const targetHiddenField = field.parent.GET.fieldByTag(parentTag + '_association_id');

            if (targetHiddenField)

                field.parent.removeField(targetHiddenField.id, false, false);

            field.parent.customStyle.class = field.parent.customStyle.class.replaceAll('list-association-target', '');

            setTimeout(function () {

                if (list) {

                    const sourceHiddenField = list.GET.fieldByTag(parentTag + '_association_rel');

                    list.customStyle.class = list.customStyle.class.replaceAll('list-association-source', '');

                    if (sourceHiddenField)

                        list.removeField(sourceHiddenField.id, false);

                    delete list.htmlAttributes['association-target-name'];

                }

            }, 350);

        };

        if (field.parent && field.parent.xml && field.parent.xml.table) {

            field.setPropriety({
                label: 'List Source',
                name: 'list_source',
                order: 3,
                value: {
                    value: '',
                    options: function () {

                        const options = [{

                            label: '', value: ''

                        }];

                        GEN.getContainers().forEach(function (c) {

                            if (field.parent.GET.tag() !== c.GET.tag() && c.xml.table)

                                options.push({

                                    label: c.GET.tag(),

                                    value: c.id

                                });

                        });

                        return options;

                    }
                },

                onEditionStart: function (e) {

                    const holder = e.input;

                    const toggle = function (v) {

                        const val = v || field.GET.target(),

                            action = val === 'listAssociation' ? 'show' : 'hide';

                        holder[action]();

                    };

                    $('.propriety-setter[rel="target"]').on('change', function () {

                        toggle($(this).val());

                    });

                    toggle();

                },
                onChange: function (v, params) {

                    let list;
                    try {

                        if (v) {

                            list = GEN.getContainer(v);
                            let setFieldCallback = function (list) {

                                const parentTag = field.id;

                                let sourceHiddenField = list.GET.fieldByTag(parentTag + '_association_rel'),

                                    targetHiddenField = field.parent.GET.fieldByTag(parentTag + '_association_id'),

                                    hiddenClass = GEN.getDeclaredField('hidden');

                                list.htmlAttributes['association-target-name'] = field.parent.GET.tag();

                                if (!targetHiddenField) {

                                    targetHiddenField = new hiddenClass.field('hidden', {});

                                    targetHiddenField.SET.tag(parentTag + '_association_id');

                                    field.parent.SET.fields([targetHiddenField]);

                                }

                                if (!sourceHiddenField) {

                                    sourceHiddenField = new hiddenClass.field('hidden', {});

                                    sourceHiddenField.SET.tag(parentTag + '_association_rel');

                                    list.customStyle.class = list.customStyle.class + ' list-association-source';

                                    field.parent.customStyle.class = field.parent.customStyle.class + ' list-association-target';

                                    list.SET.fields([sourceHiddenField]);

                                    /*field.parent.holder.on('tag-change', function(e,tag){

                                        sourceHiddenField.SET.tag( tag+'_lst_association_rel' );

                                        sourceHiddenField.parent.Transform();

                                    });*/


                                }

                            };

                            if (list)

                                setFieldCallback(list);

                            else

                                GEN.dom.on('container-set', function (e, container) {

                                    if (container.id === v)

                                        setFieldCallback(container);

                                });

                        } else {

                            list = params.oldValue ? GEN.getContainer(params.oldValue) : false;

                            RemoveAssociationFeatures(field, list);

                        }

                    } catch (e) {

                        console.log(e);

                    }

                }

            });


            field.parent.holder.on('field-remove', function (e, field) {

                if (field.GET.list_source && field.GET.list_source()) {

                    const list = GEN.getContainer(field.GET.list_source());

                    RemoveAssociationFeatures(field, list);
                }

            });


        }


        field.setPropriety({
            name: 'closerefresh',
            label: 'Refresh Parent',
            value: false,
            xslValue: 'close="refresh"',
            onEditionStart: function (o) {

                if (
                    field.GET.target && field.GET.target() === 'modal' ||
                    field.GET.target && field.GET.target() === 'right_panel' ||
                    field.GET.target && field.GET.target() === 'mpsubmit' ||
                    field.GET.target && field.GET.target() === 'right_panel_submit'
                )

                    o.input.show();

                else

                    o.input.hide();

            }

        });


        field.setPropriety({
            name: 'refresh_components',
            label: 'Reload Components',
            order: 3,

            value: {
                value: '',
                multiple: true,
                options: function () {

                    const comArr = [];

                    GEN.getContainers().forEach(function (com) {

                        comArr.push({
                            value: com.GET.tag(),
                            label: com.GET.tag()
                        })

                    })

                    return comArr;

                }
            },
            onEditionStart: function (o) {

                const toggle = function (v) {

                    //var _target = v || ( field.GET.target ?  field.GET.target : null),
                    const _target = v || (field.GET.target ? field.GET.target() : null),

                        action = (_target === 'submit_ajax' || _target === 'submit_notvalidate' || _target === 'submitpage2file') ? 'show' : 'hide';

                    o.input[action]();

                };

                $('#gen-edition-modal select[name="edit-target"]').on('change', function () {

                    toggle($(this).val());

                });

                toggle();

            }

        });

        field.setPropriety({
            name: 'refresh_submit',
            label: 'Submit',
            value: false,
            xslValue: 'refresh-submit="true"',
            onEditionStart: function (o) {

                setTimeout(function () {

                    const ctrlSelector = '.propriety-setter.checker[rel="closerefresh"]';

                    const checkVisibility = function () {

                        const closeref = $(ctrlSelector),

                            action = closeref.is(':checked') ? 'show' : 'hide';

                        console.log(action);

                        o.input[action]();

                    };

                    $('#gen-edition-modal').on('change', ctrlSelector, checkVisibility);

                    checkVisibility();

                }, 250);


            }

        });

        const jsIncludes = [
            {path: '/plugins/sharpadbclient/sharpadbclient.js'}
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

                const checkTarget = function (v) {
                    const target = v ? v : field.GET.target ? field.GET.target() : null;

                    if (target === 'sharpadbclient') {

                        o.input.show();

                        jsIncludes.forEach(function (e) {
                            field.includes.js.unshift(e);
                        });
                    } else {
                        if ($.IGRP.components.select2) {
                            $.IGRP.components.select2.select2Init({
                                field: $('select', o.input)
                            });
                        }

                        o.input.hide();

                        GEN.removeIncluds(jsIncludes, 'js', field);
                    }
                };

                $('select[name="edit-target"]').on('change', function () {
                    checkTarget($(this).val());
                });

                checkTarget();
            }
        });

        if (!targetRulesSet) {
            $.IGRP.rules.set({
                "edit-target": [
                    {
                        "name": "",
                        "event": "change",
                        "condition": "equal",
                        "value": "changesrc",
                        "value2": "",
                        "patern": "",
                        "patern_custom": "",
                        "action": "show",
                        "targets": "edit-target_fields",
                        "procedure": "",
                        "msg_type": "",
                        "msg": "",
                        "opposite": "1",
                        "isTable": false
                    },
                    {
                        "name": "",
                        "event": "change",
                        "condition": "equal",
                        "value": "modal",
                        "value2": "",
                        "patern": "",
                        "patern_custom": "",
                        "action": "show",
                        "targets": "edit-closerefresh",
                        "procedure": "",
                        "msg_type": "",
                        "msg": "",
                        "opposite": "1",
                        "isTable": false
                    },
                    {
                        "name": "",
                        "event": "change",
                        "condition": "equal",
                        "value": "right_panel",
                        "value2": "",
                        "patern": "",
                        "patern_custom": "",
                        "action": "show",
                        "targets": "edit-closerefresh",
                        "procedure": "",
                        "msg_type": "",
                        "msg": "",
                        "opposite": "",
                        "isTable": false
                    },
                    {
                        "name": "",
                        "event": "change",
                        "condition": "equal",
                        "value": "mpsubmit",
                        "value2": "",
                        "patern": "",
                        "patern_custom": "",
                        "action": "show",
                        "targets": "edit-closerefresh",
                        "procedure": "",
                        "msg_type": "",
                        "msg": "",
                        "opposite": "",
                        "isTable": false
                    },
                    {
                        "name": "",
                        "event": "change",
                        "condition": "equal",
                        "value": "right_panel_submit",
                        "value2": "",
                        "patern": "",
                        "patern_custom": "",
                        "action": "show",
                        "targets": "edit-closerefresh",
                        "procedure": "",
                        "msg_type": "",
                        "msg": "",
                        "opposite": "",
                        "isTable": false
                    }
                ]
            });
            targetRulesSet = true;
        }

    };

    GEN.setBTNClass = function (field, _default, prefix) {

        const pref = prefix ? prefix + ' ' : '';

        field.setPropriety({
            name: 'class',
            value: {
                value: _default ? _default : 'primary',
                size: '12',
                list: {
                    items: [
                        {label: 'Default', value: pref + 'default'},
                        {label: 'Primary', value: pref + 'primary'},
                        //{ label:'Secondary',value :pref+'secondary' },
                        {label: 'Success', value: pref + 'success'},
                        {label: 'Info', value: pref + 'info'},
                        {label: 'Warning', value: pref + 'warning'},
                        {label: 'Danger', value: pref + 'danger'},
                        {label: 'Purple', value: pref + 'purple'},
                        {label: 'Grey', value: pref + 'grey'},
                        {label: 'Black', value: pref + 'black'},
                        {label: 'Link', value: pref + 'link'}

                    ],
                    itemTemplate: '<span class="btn btn-xs btn-#value#">#label#</span>'
                }
            }
        });
    }

    GEN.getFieldSize = function (m) {
        const arr = [],
            max = m || 12;

        for (let i = max; i >= 1; i--) {
            arr.push({
                value: i,
                label: 'col-sm-' + i + '  (' + ((i * 100) / 12).toFixed(0) + '%)'
            });
        }
        return arr;
    }

    GEN.getFieldSizeOptions = function (field) {

        const sizeOptions = field.GET.type() === 'texteditor' || field.GET.type() === 'separator' ?
            {
                value: 12,
                options: [{value: 12, label: 'col-sm-12 (100%)'}]
            } :
            {
                value: field.parent.formOptions ? field.parent.formOptions.lastSize : 12,
                options: GEN.getFieldSize()
                //options:[{value:'12',label:'100%'},{value:'9',label:'75%'},{value:'8',label:'66.66%'},{value:'6',label:'50%'},{value:'4',label:'33%'},{value:'3',label:'25%'},{value:'2',label:'16.6%'},{value:'1',label:'8.33%'}]
            };

        return sizeOptions
    }

    GEN.setFormFieldAttr = function (field) {

        const container = field.parent;

        const type = field.GET.type();
        //console.log(field);
        container.formOptions = {
            lastSize: container.formOptions && container.formOptions.lastSize ? container.formOptions.lastSize : '3'
        }

        field.setPropriety({
            name: 'maxlength',
            propriety: 250,
            onChange: function (value) {
                field.holder.find('[maxlength]').attr('maxlength', value);
            }
        });

        if (!field.hidden) {
            //var defaultSize = field.GET.type() == 'radiolist' || field.GET.type() == 'checkboxlist' ? 12 : container.formOptions.lastSize;
            const sizeOptions = type === 'texteditor' || type === 'separator' ?
                {
                    value: 12,
                    options: [{value: 12, label: 'col-sm-12 (100%)'}]
                } :
                {
                    value: container.formOptions.lastSize,
                    options: GEN.getFieldSize()
                    //options:[{value:'12',label:'100%'},{value:'9',label:'75%'},{value:'8',label:'66.66%'},{value:'6',label:'50%'},{value:'4',label:'33%'},{value:'3',label:'25%'},{value:'2',label:'16.6%'},{value:'1',label:'8.33%'}]
                };

            //if(){
            const setFieldAttr = ['electronicsignature', 'button', 'img', 'plaintext', 'separator', 'link'];

            if (!setFieldAttr.includes(type)) {

                field.setPropriety({
                    name: 'required',
                    value: false,
                    xslValue: 'required="required"' //XSL VALUE WHEN PROPRIETY IS TRUE
                });

                if (type !== "file") {
                    field.setPropriety({
                        name: 'change',
                        propriety: false,
                        xslValue: 'IGRP_change' //XSL VALUE WHEN PROPRIETY IS TRUE
                    });
                }

                const setReadonly = ["select", "file", 'filesigner'];

                if (!setReadonly.includes(type)) {
                    field.setPropriety({
                        name: 'readonly',
                        propriety: false,
                        xslValue: 'readonly="readonly"' //XSL VALUE WHEN PROPRIETY IS TRUE
                    });
                }

                if (field.type !== 'filesigner') {
                    field.setPropriety({
                        name: 'disabled',
                        propriety: false,
                        xslValue: 'disabled="disabled"' //XSL VALUE WHEN PROPRIETY IS TRUE
                    });
                }

                const setDisablehtml = ['text', 'textarea']

                if (setDisablehtml.includes(type)) {
                    field.setPropriety({
                        label: 'Disable HTML',
                        name: 'disablehtml',
                        propriety: true,
                        xslValue: 'disablehtml="true"' //XSL VALUE WHEN PROPRIETY IS TRUE
                    });
                }
            }

            const setPlaceholder = ['electronicsignature', 'filesigner', "button", "plaintext", "select", "file", "radio", "checkbox", "radiolist", "checkboxlist"];

            if (!setPlaceholder.includes(type)) {

                field.setPropriety({
                    name: 'placeholder',
                    value: ''
                });

                if (container.GET.type() !== 'formlist') {

                    field.setPropriety({
                        label: 'Description Label',
                        name: 'desclabel',
                        value: false,
                        xslValue: 'desclabel'
                    });
                }
            }

            if ((type && type === 'text') && (container.GET.type() === 'formlist' || container.GET.type() === 'form')) {

                let inputMaskIncludes = [
                        {path: '/plugins/inputmask/igrp.inputmask.js'},
                        {path: '/plugins/inputmask/jquery.inputmask.min.js'}
                    ],
                    removeIncludesJs = function (arr) {
                        arr.forEach(function (e) {
                            for (let i = 0; i < field.includes.js.length; i++) {
                                const inc = field.includes.js[i];
                                if (inc.path === e.path) {
                                    const index = field.includes.js.indexOf(inc);
                                    if (index > -1)
                                        field.includes.js.splice(index, 1);
                                    break;
                                }
                            }
                        });
                    },
                    inputMaskInc = false;

                if (!inputMaskInc && field?.proprieties?.inputmask !== undefined) {
                    inputMaskIncludes.forEach(function (e) {
                        field.includes.js.unshift(e);
                    });
                    inputMaskInc = true;
                }

                field.setPropriety({
                    name: 'inputmask',
                    label: 'Input Mask',
                    value: {
                        value: '',
                        options: [
                            {value: '', label: '-- Select Mask --'},
                            {value: 'currency', label: 'Currency Mask (#.##0)'},
                            {value: 'date', label: 'Date Mask (DD-MM-YYYY)'},
                            {value: 'monthYear', label: 'Date Mask (MM-YYYY)'}
                        ]
                    },
                    onChange: function (v) {

                        if (v !== undefined && v !== '') {

                            if (!inputMaskInc) {
                                inputMaskIncludes.forEach(function (e) {
                                    field.includes.js.unshift(e);
                                });
                                inputMaskInc = true;
                            }
                        } else {
                            removeIncludesJs(inputMaskIncludes);
                            inputMaskInc = false;
                        }

                    }
                });
            }
            //}

            field.setPropriety({
                label: 'Field Size',
                name: 'size',
                propriety: GEN.getFieldSizeOptions(field),
                onChange: function (value) {
                    container.formOptions.lastSize = value;
                }
            });

            if (type === 'checkboxlist' || type === 'radiolist') {
                field.setPropriety({
                    label: 'Child Size',
                    name: 'child_size',
                    propriety: {
                        value: 12,
                        options: GEN.getFieldSize()
                    }
                });
            }

            const hideRightProprietys = ['filesigner', 'electronicsignature'];

            if (!hideRightProprietys.includes(type)) {
                field.setPropriety({
                    name: 'right',
                    value: false,
                    xslValue: 'pull-right'
                });
            }

            const hideFormField = ['separator', 'link', 'plaintext', 'button', 'img']

            if (!hideFormField.includes(type))
                field.formField = true;

        } else {
            //field.xml.tag = 'hidden';
        }

        GEN.SetJavaTypeAttr(field)
    }

    GEN.SetJavaTypeAttr = function (field) {

        if (field.type === 'hidden' ||
            field.type === 'select' ||
            field.type === 'number' ||
            field.type === 'checkboxlist' ||
            field.type === 'radiolist' ||
            field.type === 'radio' ||
            field.type === 'checkbox')

            field.setPropriety({
                name: 'java-type',
                label: 'Java Type',
                value: {
                    value: field.javaType || '',
                    options: [
                        {value: '', label: ''},
                        {value: 'Long', label: 'Long'},
                        {value: 'String', label: 'String'},
                        {value: 'String[]', label: 'String[]'},
                        {value: 'BigInteger', label: 'BigInteger'},
                        {value: 'BigDecimal', label: 'BigDecimal'},
                        {value: 'Integer', label: 'Integer'},
                        {value: 'Short', label: 'Short'},
                        {value: 'Float', label: 'Float'},
                        {value: 'Double', label: 'Double'},
                        {value: 'int', label: 'int'},
                        {value: 'double', label: 'double'},
                        {value: 'float', label: 'float'},
                        {value: 'short', label: 'short'},
                        {value: 'long', label: 'long'},
                    ]
                }
            })

    }

    GEN.setImgAttr = function (field, p) {

        const fParent = field.parent || false;

        field.setPropriety({
            name: 'iconColor',
            value: field.proprieties.iconColor ? field.proprieties.iconColor : '#333',
            editable: false
        });

        field.setPropriety({
            name: 'iconClass',
            value: field.proprieties.iconClass ? field.proprieties.iconClass : '',
            editable: false
        });


        const name = p.name ? p.name : 'img';

        field.setPropriety({
            name: name,
            label: 'Icon',
            type: 'attrvalue',
            value: {
                value: p.value,
                size: '12',
                class: 'gen-fa-icon-setter',
                //color : field.GET.iconColor(),
                icon: '',
                setter: function () {

                    const holder = $(VARS.fontawesome.setter).clone(true);

                    const img = field.GET[name]();

                    holder.attr('attr-value', img);

                    const activeItem = $('.gen-fa-icon[rel="' + img + '"]', holder);

                    const activeParent = activeItem.attr('parent');

                    activeItem.addClass('active');

                    $('.nav-tabs>li', holder).removeClass('active');

                    $('.tab-pane', holder).removeClass('active in');

                    $('.nav-tabs>li[rel="' + activeParent + '"]', holder).addClass('active');

                    $('.tab-pane#gen-fa-' + activeParent, holder).addClass('active in');

                    holder.on('click', '.gen-fa-icon', function () {

                        const rel = $(this).attr('rel');

                        $('.gen-fa-icon', holder).removeClass('active');

                        $(this).addClass('active');

                        holder.attr('attr-value', rel);

                        //field.SET[name]( rel );

                    });

                    setTimeout(function () {

                        try {
                            $('.tab-content').animate({
                                scrollTop: activeItem.position().top
                            }, 400);

                        } catch (err) {
                            console.log(err)
                            return;
                        }

                        $('.nav-tabs', holder).tabdrop();

                    }, 250);


                    return holder;
                },
                onChange: function (v) {

                }
            },
            isField: p.isField,
            valuePersist: p.valuePersist
        });

    }

    GEN.getImagesFromDir = function (p) {
        let element;

        if (GEN.images[p.id]) {
            if (p.callback) p.callback(GEN.images[p.id]);
            //element = GEN.images[p.paramName];
        } else {
            const link = p.paramName ? p.dir + p.paramName : p.dir;
            $.ajax({
                url: link,
                dataType: 'json',
                success: function (data) {
                    if (p.callback) p.callback(data);
                    GEN.images[p.id] = data;
                }
            });
        }
        return element;
    }

    GEN.MESSAGE = function (p) {
        console.log(p.text);
        console.log(p.console);
        console.log(p.error);
    }

    GEN.resizeView = function () {
        setTimeout(function () {
            $(window).resize();
        }, 60);
    }

    GEN.configSortable = function (placeholder) {

        //if(!placeholder.parents('.gen-container-holder').first().hasClass('gen-container-copy'))

        placeholder.sortable({
            delay: 150,
            connectWith: '.gen-container-placeholder',
            scroll: false,
            forcePlaceholderSize: true,
            placeholder: VARS.class.placeHolderHover,
            items: "> li",
            handle: '.container-mover',
            tolerance: 'pointer',
            helper: function () {
                return $('<div></div>')
            },
            sort: function (e, ui) {

                if (placeholder.parents('.gen-container-holder').first().hasClass('gen-container-copy')) {
                    ui.placeholder.hide();
                    //return false;
                } else {
                    ui.placeholder.show();
                }


            },
            receive: function (e, ui) {
                if (placeholder.parents('.gen-container-holder').first().hasClass('gen-container-copy')) {
                    console.log(ui)
                    return false;
                }


                if (ui.helper && ui.helper.hasClass('gen-declared-containers')) {

                    //NEW ELEMENT DROP
                    const liHolder = ui.helper;
                    const column = $(e.target).parents(VARS.layout.columns);
                    const row = column.parent();
                    const index = liHolder.index();
                    const ph = $(e.target);
                    const type = ui.item.attr('type');

                    if (index >= 0) {
                        const name = ui.item.attr('name');

                        const container = {
                            name: name,
                            row: row,
                            column: column,
                            index: index,
                            holder: liHolder,
                            params: {
                                genType: type
                            }
                        };

                        GEN.dropContainers_ROW([container], {
                            placeholder: ph

                        });

                    } else liHolder.remove();

                    liHolder.removeAttr('style');
                } else {
                    //MOVED TO ANOTHER PH
                    const holder = ui.item,
                        col = $(holder.parents('.gen-column')[0]);

                    holder.removeAttr('style');

                    GEN.checkColumnComponents(col);
                }

                const sender = ui.sender;

                const senderCol = $(sender.parents('.gen-column')[0]);

                GEN.checkColumnComponents(senderCol);

                /*if(!sender.find('>.gen-declared-containers')[0])
					console.log(sender.parent())*/

                $('#gen-design .ui-sortable-helper').remove();
            },
            stop: function (e, ui) {
                const holder = ui.item;
                holder.removeAttr('style');
                $('#gen-design .ui-sortable-helper').remove();
            },
            update: function (e, ui) {
                $('#gen-design .ui-sortable-helper').remove();
            },
            remove: function (e, ui) {
                $('#gen-design .ui-sortable-helper').remove();
                console.log('remove')
            },
            change: function (e, ui) {

                if (ui.sender && ui.sender.find('>.gen-declared-containers').length <= 1) {

                    const senderCol = $(ui.sender.parents('.gen-column')[0]);

                    senderCol.attr('empty', true)
                }

            }
        }).disableSelection();
    }

    GEN.shadow = function (o) {
        if (o) GEN.CONTENT.addClass('shadow');
        else GEN.CONTENT.removeClass('shadow');
    }

    GEN.getRules = function () {
        const fields = GEN.getAllFields();
        const rules = {};

        fields.forEach(function (f) {

            const fname = f.GET.name();
            if (f.rules && f.rules[0])
                rules[fname] = f.rules;

        });

        return GENRULES.add(rules);
    }

    GEN.escapeXSLChars = function (str) {

        str = str.replaceAll('<', '&lt;');

        str = str.replaceAll('>', '&gt;');

        str = str.replaceAll('&', '&amp;');

        return str;
    }


    GEN.getIncludeURL = function (url) {
        const isExternal = /^https?:\/\//i.test(url);
        const relative = !isExternal;
        return relative ? '{$path}' + url : url;
    }

    const getObjectCssFiles = function (incObjects, genType) {
        let rtn = "";
        const folderGetter = genType === 'container' ? 'getContainerFolder' : 'getFieldFolder';

        for (let type in incObjects) {

            if (incObjects[type].css[0]) {
                rtn += '<!-- ' + type.toUpperCase() + ' CSS INCLUDES -->';
                incObjects[type].css.forEach(function (css) {

                    let path;
                    if (css.path) {

                        const isExternal = /^https?:\/\//i.test(css.path);
                        const relative = !(css.relative === false || isExternal);
                        path = relative ? '{$path}' + css.path : css.path;
                        const media = css.media ? 'media="' + css.media + '"' : '';

                        if (rtn.indexOf(path) === -1)
                            rtn += '<link ' + media + ' rel="stylesheet" type="text/css" href="' + path + '?v={$version}"/>';

                    } else if (css.import) {
                        for (let c in css.import) {
                            if (css.import[c] === 'import.all') {
                                //console.log('import all')
                            } else {
                                if (css.import[c][0]) {
                                    css.import[c].forEach(function (f) {
                                        path = '{$path}' + VARS.genPath + '/types/containers/' + c + '/includes/' + f;
                                        if (rtn.indexOf(path) === -1)
                                            rtn += '<link rel="stylesheet" type="text/css" href="' + path + '?v={$version}"/>';
                                    });
                                }
                            }
                        }
                    }

                });
            }
        }
        return rtn;
    };

    const getObjectJSFiles = function (incObjects, genType) {
        let rtn = "";
        const folderGetter = genType === 'container' ? 'getContainerFolder' : 'getFieldFolder';

        for (let type in incObjects) {

            if (incObjects[type].js[0]) {

                rtn += '<!-- ' + type.toUpperCase() + ' JS INCLUDES -->';

                incObjects[type].js.forEach(function (js) {
                    let path;
                    let charset = js.charset ? 'charset="' + js.charset + '"' : '';
                    if (js.path) {
                        const isExternal = /^https?:\/\//i.test(js.path);
                        const relative = !(js.relative === false || isExternal);
                        path = relative ? '{$path}' + js.path : js.path;

                        if (rtn.indexOf(path) === -1)
                            rtn += '<script ' + charset + ' type="text/javascript" src="' + path + '?v={$version}"></script>'
                    } else if (js.import) {
                        for (let c in js.import) {
                            if (js.import[c] === 'import.all') {
                                //console.log('import all')
                            } else {
                                if (js.import[c][0]) {
                                    js.import[c].forEach(function (f) {
                                        path = '{$path}' + VARS.genPath + '/types/containers/' + c + '/includes/' + f;
                                        if (rtn.indexOf(path) === -1)
                                            rtn += '<script ' + charset + ' type="text/javascript" src="' + path + '?v={$version}"></script>';
                                    });
                                }
                            }
                        }
                    }
                });

            }
        }
        return rtn;
    };


    const containersNameMask = function (name) {
        //if(name == 'graphic') rName = 'chart';

        return name;
    };

    const start = function () {
        $('body').addClass('startin');
    };
    GEN.done = function () {
        $('body').removeClass('startin waiting');
    }

    GEN.waiting = function (o) {
        const act = o === false ? 'removeClass' : 'addClass';
        $('body')[act]('waiting');
    }

    //subscribe
    GEN.onImportEnd = function () {
    };

    GEN.onImportStart = function () {
    };


    $(window).on('load', function () {
        //console.log('init');
        GEN.init();
    });

};
