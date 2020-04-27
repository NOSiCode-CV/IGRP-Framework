(function () {

    var com;

    $.IGRP.component('sharpadbclient', {

        call: function (p) {
            //$('.sa-nsweb').attr('src', "SACWebAPI:" + JSON.stringify(p));
            var notify = p.notify ? p.notify : true,
                dad    = $('#p_dad')[0] && $('#p_dad').val() ? 'prod' : 'all';
            
            $.ajax({
                url     : 'https://sac-hostservice.nosi.cv:'+com.servicePort[dad]+'/api/' + p.task ,
                method  : 'POST',
                data    : JSON.stringify(p.data),
                contentType: "application/json",
                dataType: "json",
                success : function(s){
                    if(s){
                        if(p.success)
                            p.success(s);
                        
                        if (notify) {
                            $.IGRP.notify({
                                message: s.message,
                                type   : s.type
                            });
                        }
                    }
                },
                error : function(e){
                    
                    if(p.error)
                        p.error(e);
                    
                    if(notify){
                        if (e.hasOwnProperty('responseJSON')){
                            var resp = e.responseJSON;

                            if (resp && resp.hasOwnProperty('errors')){

                                var errors = resp.errors;

                                for( n in errors){
                                    
                                    errors[n].forEach(function (er) {
            
                                        $.IGRP.notify({
                                            message: er,
                                            type   : 'danger'
                                        });
                                    });
                                }
                            }

                        }
                    }
                }
            })
        },

        servicePort : {
            prod: 10110,
            all : 44326
        },

        actions : function(str){

            var jsonEvents = {
                start : {
                    task: 'evaluationtask',
                    id  : 1
                },
                stop : {
                    task: 'evaluationtask',
                    id  : 2
                },
                sync : {
                    task: 'evaluationtask',
                    id  : 3
                },
                pause : {
                    task: 'evaluationtask',
                    id  : 4
                },
                config : {
                    task: 'apptask',
                    id  : 1
                },
                install : {
                    task: 'apptask',
                    id  : 2
                },
                uninstall : {
                    task: 'apptask',
                    id  : 3
                }
            }

            return jsonEvents[str];
        },

        run : function(p){
            var action = com.actions(p.clicked.attr('sharpadbclient')),
                params = {
                    data : {
                        id  : action.id
                    },
                    task : action.task
                };

            if(p.url)
                params.data['url'] = p.url;

            if(p.success)
                params['success'] = p.success;

            if(p.error)
                params['error'] = p.error;

            com.call(params);
        },

        init: function () {
            com = this;
        }
    }, true);

})();