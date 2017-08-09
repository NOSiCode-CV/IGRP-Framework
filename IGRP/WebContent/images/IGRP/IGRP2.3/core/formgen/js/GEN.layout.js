var GEN_LAYOUT = function(viewer){

	var layout = this;
	
	var GEN = VARS.getGen();
	
	var view = $(viewer).find('#gen-design>.gen-rows-holder');

	var sizes = 'col col-1-1 col-1-2 col-1-3 col-1-4 col-9-12';

	layout.getRows = function(includeContainerId,tabRel){
		
		var rows = layout.getContainersOnRows(view,{
			includeContainerId:includeContainerId
		});

		return rows;
	}

	layout.getContainersOnRows = function(view,parm){
		var rows = [];
		var p    = parm ? parm : {};

		$.each(view.find('>'+VARS.layout.rows),function(i,_row){
			
			var row = { columns : [] }

			$.each($(_row).find('>'+VARS.layout.columns),function(cidx,_column){

				var column = {
					size       : getSize(_column),
					containers : []
				}
				
				$.each($(_column).find('> .gen-column-inner > .gen-container-placeholder > .gen-declared-containers > .'+VARS.class.containersHolder+', > .gen-column-inner > .gen-container-placeholder > .gen-tab-holder'),function(containerIdx,_container){
					var type = $(_container).attr('type');
					var id = $(_container).attr('id');

					if(id){
						var container = GEN.getContainer(id);
						var includeId = !p.includeContainerId ? false : true;
						if(container) 
							column.containers.push(container.export(includeId))
					}
					
				});

				row.columns.push(column);
			});
			rows.push(row);
		});
		
		return rows;
	}
	//var getRow = 

	layout.addRow = function(p){
		var tabRel = p.rel ? p.rel : 'tab-0';
		var idx = p.index ? p.index : 0;

		if(view[0]){

			var id = 'row-'+guid();

			var row = $(VARS.layout.rowsHtml).attr('id',id);

			setColumnOptions(row);
			
			rtn = {
				row     : row,
				columns : []
			}

			if(p && p.columns){
			
				var columnArr = [];
				
				p.columns.forEach(function(c){
				
					var column = layout.addColumn(row,c.size);
					
					rtn.columns.push({
						html:column,
						containers:c.containers
					});

				});

			}else{
				layout.addColumn(row);
			}
			
			setRowSortable(row);
			
			if(p.parent){

				p.parent.attr('row-appender',p.parent.selector);

				p.parent.insertAt(row,idx);

			}else{
				view.insertAt(row,p.index);
			}

			if(p.callback) p.callback(rtn);

			GEN.resizeView();

			setZindex();

			//console.log(view.find('>.row').length)
			
			return row;
		}
	}

	layout.addColumn = function(row,size){
		//console.log(row);
		if(row[0]){
			
			//if(row.find('>'+VARS.layout.columns).length < 4){
				
				var newColumn = $(VARS.layout.columnsHtml);
				
				newColumn.attr('id','column-'+getTime());

				GEN.configSortable(newColumn.find('> .gen-column-inner >'+VARS.html.containersPlaceHolder));

				row.append(newColumn);


				//
				
				var length = row.find('>'+VARS.layout.columns).length;
				
				//console.log(size);

				if(size)
					newColumn.addClass(size);
				else
					$.each(row.find('>'+VARS.layout.columns),function(){
						removeSize($(this))
						//$(this).removeClass(sizes);

						$(this).addClass('col-sm-'+12/length);
					});
				

				GEN.resizeView();

				setZindex();

				GEN.checkColumnComponents(newColumn);

				return newColumn;
			/*}else{
				console.log('max 4 columns!');
			}*/

		}
	}

	layout.setRowColumns = function(p){
		var row      = $(p.row[0]);
		var strucs   = p.structure; 
		var preserve = [];

		if(row.find('>'+VARS.layout.columns).length <= strucs.length){
			strucs.forEach(function(s,i){
				if(row.find('>'+VARS.layout.columns)[i]){
					var column = $(row.find('>'+VARS.layout.columns)[i]);
					
					removeSize(column);
					
					column.addClass('col-sm-'+s);

					GEN.checkColumnComponents(column);

				}else{
					layout.addColumn(row,'col-sm-'+s);
				}
			});

		}else{
			$.each(row.find('>'+VARS.layout.columns),function(i,col){
				if(strucs[i]){
					removeSize($(col))
					//.removeClass(sizes);
					$(col).addClass('col-sm-'+strucs[i]);
				}else{
					var clone = $(col).find('> .gen-column-inner > .gen-container-placeholder > '+VARS.html.declaredContainers);
					
					if(clone)
						clone.appendTo($(row.find('>'+VARS.layout.columns)[0]).find('> .gen-column-inner >'+VARS.html.containersPlaceHolder));
					
					$(col).remove();
				}
				GEN.checkColumnComponents( $(row.find('>'+VARS.layout.columns)[0]) );
			});
		}
		GEN.resizeView();
		setZindex();
	}

	layout.getAllContainers = function(rows,array){
		var arr = array ? array : [];
		if(rows && rows[0]){
			rows.forEach(function(row){
				if(row.columns && row.columns[0]){
					row.columns.forEach(function(column){
						if(column.containers && column.containers[0]){
							column.containers.forEach(function(container){
								if(container.contents){
									arr.push(container);
									if(container.contents[0]){
										container.contents.forEach(function(c){
											layout.getAllContainers(c.rows,arr);
										});
									}
								}else{
									arr.push(container);
								}
							})
						}
					});
				}
			});
		}
		return arr;
	}

	var setColumnOptions = function(row){
		var cOpts = $(VARS.layout.columnOptionsHtml);
		
		$.each(cOpts.find('span'),function(i,li){
			var type = $(li).attr('type');
			var cols = type.split('|');
			//console.log(cols);
			cols.forEach(function(col){
				var div    = col.split('-')[1];
				var size   = 12/div;
				var column = $('<span class="'+VARS.layout.columnOptionClass+' col-sm-'+size+'"/>')
				//var column = $('<span class="'+VARS.layout.columnOptionClass+' col-'+col+'"/>');
				//$(li).append(column);
			});
		});
	
		row.find('.'+VARS.class.columnOptions).remove();
		row.find(VARS.layout.columnSettings).append(cOpts);
	}

	var setZindex = function(){
		var length = $(VARS.layout.rows).length;
		$.each($(VARS.layout.rows),function(i,row){
			//$(row).css('z-index',length-i)
		});
	}

	layout.setViewSortable = function(_view){
		//console.log(_view[0])
		if(_view[0]){
			_view.sortable({
				//containment : "parent",
				items       : VARS.layout.rows,
				tolerance   : 'cursor',
				scroll      : false,
				axis: "y",
				stop:setZindex,
				connectWith:'.gen-rows-holder',
				handle      : '.row-options',
				//handle: '.column-mover',
			}).disableSelection();
		}
	}

	var setRowSortable = function(row){
		//console.log(row)
		row.sortable({
			//containment : "parent",
			items       : '>'+VARS.layout.columns,
			tolerance   : 'pointer',
			handle      : '.col-options',
			//placeholder : 'column-placeholder',
			scroll      : false,
			//axis: "x"
		}).disableSelection();
	}

	var setEvents = function(){
		//add Column
		$(VARS.html.view).on('click',VARS.layout.columnSettingsItem,function(){
			var parent = $($(this).parents('.gen-rows-holder')[0]);
			
			var row   = $($(this).parents(VARS.layout.rows)[0]);//parent.find(VARS.layout.rows);
			
			var layoutStr = $(this).attr('data-layout');

			var strucs   = [],
				grid   	 = 0;

			if(layoutStr == 'custom'){
				var customCol = '',
					idx 	  = 0;

				$.each(row.find('>'+VARS.layout.columns),function(i,col){
					var customClass = $(col).attr('class');
					if (customClass){
						customClass = customClass.split(' ');
						if (i > 0) 
							customCol +=',';

						customCol += customClass[1].split('col-sm-')[1];
						idx +=1;
					}
				});

				customCol = customCol != '' && idx > 1 ? customCol : "4,4,2,2";

				var cStrucs = prompt("Custom", "A soma deve ser 12. Ex: "+customCol);

				if (cStrucs){
					if (cStrucs.indexOf('Ex:') != -1){
						cStrucs = cStrucs.split('Ex:')[1];
					} 

					strucs = $.trim(cStrucs).split(',');
				}
			}else
				strucs = layoutStr.split(',');

			if (strucs.length > 0) {
				/*strucs.forEach(function(c,i){
					grid +=c*1;
				});*/

				//if(grid == 12){
					layout.setRowColumns({
						row      :row,
						structure:strucs
					});
				/*}else
					alert("A soma deve ser 12. Ex: 4,4,2,2");*/
			}
			/*if(layoutStr == 'custom'){
				var strucs = prompt("Custom", "A soma deve ser 12. Ex: 4,4,2,2");
				console.log(strucs)
			}else{
				var strucs = layoutStr.split(',');

				layout.setRowColumns({
					row      :row,
					structure:strucs
				});
			}*/

			

			/*var type  = $(this).attr('type');

			var strucs = type.split('|');
			
			layout.setRowColumns({
				row      :row,
				structure:strucs
			});
			*/
			return false;
		});
		//add Column
		$(VARS.html.view).on('click',VARS.layout.addRow,function(){
			var rowAppenderSelector = $(this).parents('[row-appender]').first().attr('row-appender');
			var parent              = rowAppenderSelector ? $($(this).parents(rowAppenderSelector)[0]) : $($(this).parents('.gen-rows-holder')[0]);
			var index               = $(this).parents(VARS.layout.rows).index()+1;


			layout.addRow({index:index, parent:parent});
			
			
			
			setZindex();
			return false;
		});

		$(VARS.html.view).on('click',VARS.layout.deleteRow,function(){
			var parent = $($(this).parents('.gen-rows-holder')[0]);
			var rows   = parent.find('>'+VARS.layout.rows);
			
			if(rows.length > 1){
				var row = $($(this).parents(VARS.layout.rows)[0]);
				if(confirm('Remove Row?')){
					layout.rowDeleteConfirm(row);
					row.remove();
				}
			}
			setZindex();
		});
		//sort columns
		setRowSortable($(VARS.layout.rows));

		layout.setViewSortable(view);

		setZindex();
		//setSortable($(VARS.layout.rows));
		return false;
	}

	var removeSize = function(column){
		column.removeClass (function (index, css) {
		    return (css.match (/(^|\s)col-\S+/g) || []).join(' ');
		});
	}

	var getSize = function(_column){
		var size = $.grep(_column.className.split(" "), function(v, i){
	       return v.indexOf('col') === 0;
	   }).join();

		return size;
	}

	var getTime = function(){
		var date = new Date();
		return date.getTime()
	}

	var init = function(){
		setEvents();
	}


	//override
	layout.rowDeleteConfirm = function(){};

	init();
}