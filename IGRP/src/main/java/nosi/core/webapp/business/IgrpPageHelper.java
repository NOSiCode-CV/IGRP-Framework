package nosi.core.webapp.business;

import org.hibernate.Session;

import nosi.core.webapp.Core;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
/**
 * Zanilda.Miranda
 * 10 de mar. de 2022
 */
public abstract class IgrpPageHelper<M extends Model, V extends View> {
	
	protected Session session;
	protected M model;
	protected V view;
	
	protected IgrpPageHelper(Session session, M model, V view) {
		this.session = session;
		this.model = model;
		this.view = view;
	}
	
	
}
