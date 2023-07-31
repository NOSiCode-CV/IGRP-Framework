$(function () {
  const configPicker = (el) => {
    const controller = $(el).parent().find("input.form-control");

    const picker = Pickr.create({
      el: el,
      theme: "nano",
      //container: $(el).parent()[0],
      default: controller.val() || "",
      swatches: [
        "#405189", //primary
        "#3577f1", //secondary
        "#0ab39c", //success
        "#299cdb", //info
        "#f7b84b", //warning
        "#f06548", //danger
        "#212529", //dark
      ],
      components: {
        preview: !0,
        opacity: !0,
        hue: !0,
        interaction: { clear: !0, save: !0 },
      },
      i18n: {
        "btn:save": $.IGRP.locale?.get("confirm"),
        "btn:cancel": $.IGRP.locale?.get("cancel"),
        "btn:clear": $.IGRP.locale?.get("clear"),
      },
    });

    picker.on("save", (color) => {
      controller.val(color?.toHEXA()?.toString());
      picker.hide();
    });

    return picker;
  };

  $.IGRP.component(
    "colorpicker2",
    {
      list: {},
      //config color picker events when placed in a separatorlst
      separatorListConfig: function (pickers) {

        const com = this;
      
        var slist = pickers.parents(".IGRP-separatorlist");
     
        if (slist[0]) {
          var events = [
            "color-field-add" /*,'color-field-reset'*/,
            "color-field-edit",
          ];

          console.log(slist)

          $.each(slist, function (i, sl) {

            sl.events.declare(events);

            sl.events.on(
              "color-field-add",
              function (o) {
                return (
                  '<span class="separator-list-td-val color" style="background-color:'+o.value +';height: 10px;display: block;"></span>'
                );
              },
              true
            );

            sl.events.on(
              "color-field-edit",
              function (o) {
                const id = o.field.attr('id');
                com.list[id]?.setColor(o.value);
              },
              true
            );

            sl.events.on('color-field-reset',function(o){
              console.log(o)
                /*const id = o.field.attr('id');
                console.log(id)
                com.list[id]?.setColor('');*/
                //o.parents('.form-color-picker').colorpicker('setValue','');
              },true);
          });
        }
      },
      //config color picker events when placed in a formlist
      formListConfig: function (parent) {},
      init: function (parent) {
        const com = this;
        const pickers = parent
          ? parent.find(".colorpicker-input")
          : $(".colorpicker-input");



        com.separatorListConfig( pickers );

        pickers.each((i, el) => {
          const id = $(el).attr("rel");
          com.list[id] = configPicker(el);
        });

        

      },
    },
    true
  );
});
