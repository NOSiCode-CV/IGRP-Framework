(function () {
  var gen = VARS.getGen();
  gen.defineGlobalProperty("table-style", (object, defaults = {}) => {

    
    object?.setProperty({
      name: "tableHeaderStyle",
      label: $.IGRP.locale.get("gen-table-header-style"),
      size: 12,
      value: {
        value: defaults.tableHeaderStyle || "",
        list: {
          items: [
            { value: "", label: $.IGRP.locale.get("ui-white") },
            
            //{ value: "table-secondary", label: $.IGRP.locale.get("ui-secondary") },
            //{ value: "table-success", label: $.IGRP.locale.get("ui-success") },
            //{ value: "table-info", label: $.IGRP.locale.get("ui-info") },
            //{ value: "table-warning", label: $.IGRP.locale.get("ui-warning") },
           // { value: "table-danger", label: $.IGRP.locale.get("ui-danger") },
            { value: "table-light", label: $.IGRP.locale.get("ui-gray") },
            //{ value: "table-primary", label: $.IGRP.locale.get("ui-primary") },
            //{ value: "table-dark", label: $.IGRP.locale.get("ui-dark") },
            
          ],
          itemTemplate: ({ label, value }) => {
            var bg = value.split("table-")[1];
            return `<div>
                        <a href="#" class="btn btn-sm btn-${bg} btn-rounded d-flex align-items-center">
                            <span  class="btn-text">${label}</span>
                        </a>
                    </div>`;
          },
        },
      },
    });
    
    object?.setProperty({
      name: "hoverable",
      label: ":hover",
      value: defaults?.hoverable || false,
      xslValue: "table-hover",
    });
    object?.setProperty({
      name: "striped",
      label: $.IGRP.locale.get('table-striped'),
      value: defaults?.hoverable || true,
      xslValue: "table-striped",
    });
    object?.setProperty({
      name: "bordered",
      label: "Mostrar bordas",
      value: defaults?.hoverable || false,
      xslValue: "table-bordered",
    });
  });
})();
