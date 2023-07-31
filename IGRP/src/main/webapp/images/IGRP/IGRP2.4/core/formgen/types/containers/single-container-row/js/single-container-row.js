this[VARS.name].declareContainer({
  name: "single-container-row",
  container: function (name, tparams) {
    CONTAINER.call(this, name, tparams);
    var container = this;
    var GEN = __GEN;

    container.xml.structure = "form";

	container.includes = {
		css : [
			{
				path:'/components/single-container-row/style.css'
			}
		]
	}

    container.contents = [
      {
        rows: [],
      }
    ];

	const placeholder = ()=>$('.gen-container-placeholder', container.holder).first();

	const row = ()=>placeholder().parents('.row').first();

	const column = ()=>row().find('.gen-column').first();

	const getContainers = ()=>{
		var rtn = [];
		container.contents.forEach((content)=>{
			content.rows?.forEach((row)=>{
				row.columns.forEach((col)=>{
					rtn = rtn.concat(col.containers)
				})
			})
		});
		return rtn;
	}


	const addContainer = ()=>{

		const liHolder = $(`<li class="gen-declared-containers" type="statbox" name="statbox"></li>`);

		placeholder().append(liHolder);
		
		var container = {
			name   : 'statbox',
			row    : row(),
			column : column(),
			//index  : index,
			holder : liHolder,
			params : {
				genType   : 'container'
			}
		}

		GEN.dropContainers_ROW([container],{
			placeholder:placeholder()
		});
	}

	const DrawEnd = ()=>{
		updateContents();
		if(!getContainers()[0]){
			addContainer();
			
		}else{

		}
	}

    container.onDrawEnd = function () {
      var boxBody = $(
        ">.container-contents>.igrp-inner-section>.inner-body",
        container.holder
      );

      boxBody.addClass("gen-rows-holder");

      GEN.layout.setViewSortable(boxBody);

      container.setContents(tparams.contents);

	 // $( ".gen-container-placeholder", container.holder ).sortable( "destroy" );

	  DrawEnd();

      container.Transform = function () {
        container.holder.find(".c-holder-loading").hide();

		DrawEnd();

        return false;
      };
    };

    container.XSLToString = function (e) {
      var rtn = "";
      var xsl = $(container.getXSL());

      container.contents.forEach(function (content, cidx) {
        var contentRows = $.parseXML(
          setXmlnsAttr("<div>" + GEN.designRows(content.rows) + "</div>")
        );
        xsl.find(".inner-body").append(contentRows.documentElement);
      });

      rtn = new XMLSerializer().serializeToString(xsl[0]);
      rtn = rtn.replaceAll(
        'xmlns:xsl="http://www.w3.org/1999/XSL/Transform"',
        ""
      );

      return rtn;
    };

    container.beforeExport = function (c) {
      updateContents();
      c.contents = [];
      container.contents.forEach(function (cont) {
        c.contents.push(cont);
      });
      return c;
    };

    var getBoxTools = function () {
      return (
        '<div class="box-tools pull-right">' +
        '<a class="btn btn-box-tool"><i class="fa fa-chevron-up"></i></a>' +
        "</div>"
      );
    };


    container.setContents = function (contents, clear) {
      var holder = $(
        $(
          "> .container-contents > .igrp-inner-section > .inner-body",
          container.holder
        )[0]
      );
      updateContents();
      if (clear == true) {
        var contentsContainers = holder.find(".gen-container-holder");
        $.each(contentsContainers, function (i, c) {
          var cId = $(c).attr("id");
          var cType = $(c).attr("type");

          if (cId) GEN.removeContainer(cId);
        });
        holder.html("");
      }

      if (contents && contents[0]) {
        //var contents = contents;
        contents.forEach(function (c) {
          if (c && c.rows && c.rows[0]) {
            var rows = c.rows;
            var arr = GEN.addContainersPerRow(rows, holder);
            GEN.dropContainers_ROW(arr, {});
          }
        });
      } else GEN.layout.addRow({ parent: holder });
    };

    var updateContents = function () {
      container.contents.forEach(function (t) {
        var holder = $(
          $(
            "> .container-contents > .igrp-inner-section > .inner-body",
            container.holder
          )[0]
        );
        var rows = GEN.layout.getContainersOnRows(holder, {
          includeContainerId: true,
        });
        t.rows = rows;
      });
    };
  },
});
