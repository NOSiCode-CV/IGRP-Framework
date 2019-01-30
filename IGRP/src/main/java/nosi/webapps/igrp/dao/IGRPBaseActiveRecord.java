package nosi.webapps.igrp.dao;

import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.Core;

public class IGRPBaseActiveRecord<T> extends BaseActiveRecord<T> {
	
	@Override
	public void setConnectionName(String connectionName) {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public T findOne(Object value) {
		if(value!=null)
			return super.findOne(Core.toInt(value.toString()));
		throw new IllegalArgumentException();
	}
	
	@Override
	public String getConnectionName() {
		return new ConfigApp().getBaseConnection();
    }
}
