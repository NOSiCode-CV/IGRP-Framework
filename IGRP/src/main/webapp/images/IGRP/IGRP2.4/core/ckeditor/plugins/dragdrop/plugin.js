CKEDITOR.plugins.add( 'dragdrop', {

		init: function( editor ) {
			

			// This feature does not have a button, so it needs to be registered manually.
			//editor.addFeature( editor.widgets.registered.dragdrop );

			// Handle dropping a contact by transforming the contact object into HTML.
			// Note: All pasted and dropped content is handled in one event - editor#paste.
			editor.on( 'paste', function( evt ) {
				var contact = evt.data.dataTransfer.getData( 'contact' );
				if ( !contact ) {
					return;
				}

				evt.data.dataValue =
					'<span class="drag">' +
						'<a href="mailto:' + contact.email + '" class="p-name u-email">' + contact.name + '</a>' +
						' ' +
						'<span class="p-tel">' + contact.tel + '</span>' +
					'</span>';
			} );
		}
	} );