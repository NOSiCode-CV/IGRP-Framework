(function () {
	var GEN = VARS.getGen();
  
	const HeaderContainer = $(".igrp-page-header");
  
	var HeaderRow;
  
	const AddHeader = (type='page_header_basic', contents) => {

	  const params = {
		  genType : 'container',
		  proprieties : {
			title : GEN.DETAILS ? GEN.DETAILS.action_descr : '',
			tag : 'page_header'
		  }
	  }
	  if(!HeaderRow)
		  HeaderRow = GEN.layout.addRow({
			  parent: HeaderContainer,
			  controllers: false,
		  });
  
	  var container = {
		  name   : type,
		  row    : HeaderRow,
		  column : HeaderRow.find('.gen-column'),
		  index  : 0,
		  params : Object.assign(params, contents)
	  }

	  GEN.dropContainers_ROW([container],{
		  placeholder:  $('.gen-container-placeholder',HeaderRow),
		  callback : (c)=>{
			GEN.Headers.selected = {
				type: type,
				container: c
			}
		  }
	  });

	  $(`.page-header-item[type="${type}"]`).addClass('active');

	};
  
	const removeCurrentHeader = ()=>{
	  if(HeaderRow)
		  HeaderContainer.html('');
	}
  
	const setEvents = () => {
	  $(".page-header-item").on("click", (e) => {
		const item = e.target;
		const type = $(item).attr("type");

		//remove all
		$('.igrp-page-header .gen-container-holder').each( (i,container)=>{
			var id = $(container).attr('id');
			GEN.removeContainer(id);

		});
		
		AddHeader(type);

	  });
	};
  
	GEN.Headers = {
	  selected: null,
	  row : ()=>HeaderRow,
	  add:AddHeader,
	  import : (data)=>{
		const type = data?.columns[0]?.containers[0]?.proprieties?.type;
		AddHeader(type, data.columns[0]?.containers[0])
	  },
	  export : ()=>{
		  return GEN.layout.getContainersOnRows(HeaderContainer)
	  },
	  init: () => {
		setEvents();
	  }
	};
  
	GEN.on("ready", () => {
	  GEN.Headers.init();
	});
  })();
  