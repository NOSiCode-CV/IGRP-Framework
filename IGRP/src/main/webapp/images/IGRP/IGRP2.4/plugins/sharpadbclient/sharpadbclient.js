(function () {

    var com;

    $.IGRP.component('sharpadbclient', {

        call : function (p) {

            var notify = p.notify ? p.notify : true,
                port   = $('#p_dad')[0] && $('#p_dad').val() ? $('#p_dad').val() : 'all';

            port = $.IGRP.components.sharpadbclient.serviceport[port];
           
            $.ajax({
                url         : 'https://sac-brig.gov.cv:'+ port + '/api/' + p.task,
                method      : 'POST',
                data        : JSON.stringify(p.data),
                contentType : "application/json",
                dataType    : "json",
                success     : function (s) {
                    if (s) {

                        s.type = 'success';

                        if(s.status == 500){
                            s.type  = 'danger';
                            s.title = 'Algo deu errado, por favor tente novamente.'
                        }

                         
                    
                        if (p.success)
                            p.success(s);

                        if (notify) {
                            $.IGRP.notify({
                                message: s.title,
                                type   : s.type
                            });
                        }
                    }
                },
                error : function (e) {
                    
                    if (p.error)
                        p.error(e);

                    if (notify) {

                        if (e.hasOwnProperty('responseJSON')) {

                            var resp = e.responseJSON;

                            if (resp && resp.hasOwnProperty('title')) {

                                $.IGRP.notify({
                                    message: resp.title,
                                    type   : 'danger'
                                });
                            }

                        }
                    }
                }
            })
        },

        serviceport : {
            prod: 10110,
            all : 10108
        },

        actions: function (str) {

            var jsonEvents = {
                start    : {
                    task : 'evaluationtask',
                    id   : 1
                },
                stop     : {
                    task : 'evaluationtask',
                    id   : 2
                },
                sync     : {
                    task : 'evaluationtask',
                    id   : 3
                },
                pause    : {
                    task : 'evaluationtask',
                    id   : 4
                },
                config   : {
                    task : 'apptask',
                    id   : 1
                },
                install  : {
                    task : 'apptask',
                    id   : 2
                },
                uninstall: {
                    task : 'apptask',
                    id   : 3
                }
            }

            return jsonEvents[str];
        },

        run : function (p) {
            
            var action = com.actions(p.clicked.attr('sharpadbclient')), 

                params = {
                    data   : {
                        id : action.id
                    },
                    task   : action.task
                };

            if (p.url)
                params.data['url'] = p.url;

            if (p.success)
                params['success'] = p.success;

            if (p.error)
                params['error'] = p.error;

            com.call(params,com);
        },

        init : function () {
            com = this;
        }
    }, true);

})();