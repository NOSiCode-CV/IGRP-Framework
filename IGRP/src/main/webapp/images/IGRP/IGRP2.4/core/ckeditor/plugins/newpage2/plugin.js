CKEDITOR.plugins.add( 'newpage2', {
    icons: 'noimage',
    init: function( editor ) {

    	editor.addCommand( 'insertNewpage',{
			exec : function( editor ){ 
				var vData = editor.getData();   
				var timestamp = '<hr class="page" ><div size="A4">'+
				    	'<div id="header"><p>-- Cabe&ccedil;alho --&nbsp;</p></div><p class="page">&nbsp;</p>'+
				    	'<div id="content"><p>-- Corpo --&nbsp;</p></div>'+
				    	'<div id="footer"></div>'+
				  	'</div><hr class="page" /><p class="page">&nbsp;</p>';
				vData+=timestamp;
				editor.setData(vData);
			}
		});

        editor.ui.addButton( 'NewPage2', {
            label: 'Nova Página',
            command: 'insertNewpage',
            toolbar: 'document'
        });
    }
});