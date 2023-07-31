var GEN_LAYOUT = function(viewer){

	var layout = this;
	
	var GEN = VARS.getGen();
	
	var view = $(viewer).find('#gen-design');

	var sizes = 'col col-1-1 col-1-2 col-1-3 col-1-4 col-9-12';

	layout.getRows = function(includeContainerId,tabRel){
		
		var rows = layout.getContainersOnRows(view,{
			includeContainerId:includeContainerId
		});

		return rows;
	}

	layout.getContainersOnRows = function(view,parm){
		var rows = [];
		var p = parm ? parm : {};

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
						if(container) column.containers.push(container.export(includeId))
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
			var row = $(VARS.layout.rowsHtml).attr('id','row-'+getTime());

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
				//parent

				p.parent.attr('row-appender',p.parent.selector);

				p.parent.insertAt(row,idx);

				/*if(p.parent.hasClass('gen-tab-holder')){ //is TAB CONTENT
					p.parent.find('.gen-tab-c-item[rel="tab-1"]').insertAt(row,idx);
				}else{
					p.parent.insertAt(row,idx);
				}*/
			}
			else{
				view.insertAt(row,p.index);
			}

			if(p.callback) p.callback(rtn);

			GEN.resizeView();
			setZindex();
			return row;
		}
	}

	layout.addColumn = function(row,size){
		//console.log(row);
		if(row[0]){
			if(row.find('>'+VARS.layout.columns).length < 4){
				var newColumn = $(VARS.layout.columnsHtml);
				
				newColumn.attr('id','column-'+getTime());

				GEN.configSortable(newColumn.find('> .gen-column-inner >'+VARS.html.containersPlaceHolder));

				row.append(newColumn);
				
				var length = row.find('>'+VARS.layout.columns).length;
				
				if(size){
					newColumn.addClass(size);
				}else{
					$.each(row.find('>'+VARS.layout.columns),function(){
						$(this).removeClass(sizes);
						$(this).addClass('col-1-'+length);
					});
				}

				GEN.resizeView();
				setZindex();
				return newColumn;
			}else{
				console.log('max 4 columns!');
			}

		}
		
	}

	layout.setRowColumns = function(p){
		var row    = $(p.row[0]);
		var strucs = p.structure; 

		var preserve = [];

		if(row.find('>'+VARS.layout.columns).length <= strucs.length){
			console.log('1')
			strucs.forEach(function(s,i){

				if(row.find('>'+VARS.layout.columns)[i]){
					//console.log($(row.find(VARS.layout.columns)[i]))
					$(row.find('>'+VARS.layout.columns)[i]).removeClass(sizes);
					$(row.find('>'+VARS.layout.columns)[i]).addClass('col-'+s);
				}else{
					//console.log('add')
					layout.addColumn(row,'col-'+s);
				}

			});
		}else{
			$.each(row.find('>'+VARS.layout.columns),function(i,col){
				if(strucs[i]){
					$(col).removeClass(sizes);
					$(col).addClass('col-'+strucs[i]);
				}else{
					var clone = $(col).find('> .gen-column-inner > .gen-container-placeholder > '+VARS.html.declaredContainers);
					
					if(clone)
						clone.appendTo($(row.find('>'+VARS.layout.columns)[0]).find('> .gen-column-inner >'+VARS.html.containersPlaceHolder));
					
					$(col).remove();
				}
			});
		}
		GEN.resizeView();
		setZindex();
	}

	var setColumnOptions = function(row){
		var cOpts = $(VARS.layout.columnOptionsHtml);
		
		$.each(cOpts.find('span'),function(i,li){
			var type = $(li).attr('type');
			var cols = type.split('|');
			cols.forEach(function(col){
				var column = $('<span class="'+VARS.layout.columnOptionClass+' col-'+col+'"/>');
				$(li).append(column);
			});
		});
		row.find('.'+VARS.class.columnOptions).remove();
		row.find(VARS.layout.columnSettings).append(cOpts);
	}

	var setZindex = function(){
		var length = $(VARS.layout.rows).length;
		$.each($(VARS.layout.rows),function(i,row){
			$(row).css('z-index',length-i)
		});
	}

	layout.setViewSortable = function(_view){
		if(_view[0]){
			_view.sortable({
				containment : "parent",
				items       : VARS.layout.rows,
				tolerance   : 'pointer',
				scroll      : false,
				axis: "y",
				stop:setZindex
			}).disableSelection();
		}
	}

	var setRowSortable = function(row){
		row.sortable({
			containment : "parent",
			items       : '>'+VARS.layout.columns,
			tolerance   : 'pointer',
			scroll      : false,
			axis: "x"
		}).disableSelection();
	}
	var setEvents = function(){
		//add Column
		$(VARS.html.view).on('click',VARS.layout.columnSettingsItem,function(){
			var parent = $($(this).parents('.gen-rows-holder')[0]);

			//console.log(parent);

			var row   = $($(this).parents(VARS.layout.rows)[0]);//parent.find(VARS.layout.rows);

			var type  = $(this).attr('type');

			var strucs = type.split('|');
			
			layout.setRowColumns({
				row      :row,
				structure:strucs
			});
			
		});
		//add Column
		$(VARS.html.view).on('click',VARS.layout.addRow,function(){
			var rowAppenderSelector = $(this).parents('[row-appender]').first().attr('row-appender');
			var parent              = rowAppenderSelector ? $($(this).parents(rowAppenderSelector)[0]) : $($(this).parents('.gen-rows-holder')[0]);
			var index               = $(this).parents(VARS.layout.rows).index()+1;

			layout.addRow({index:index, parent:parent});
			
			setZindex();
		});

		$(VARS.html.view).on('click',VARS.layout.deleteRow,function(){
			var parent = $($(this).parents('.gen-rows-holder')[0]);
			var rows   = parent.find('>'+VARS.layout.rows);
			
			if(rows.length > 1){
				var row = $($(this).parents(VARS.layout.rows)[0]);
				if(confirm('Delete Row?')){
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
	}
	var removeSize = function(column){
		//sizes.forE
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