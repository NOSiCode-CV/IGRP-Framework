package nosi.webapps.igrp.dao;

import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.config.ConfigApp;

public class IGRPBaseActiveRecord<T> extends BaseActiveRecord<T> {
	
	@Override
    public String getConnectionName() {
    	// TODO Auto-generated method stub
    	//return Globals.CONNECTION_NAME;
		return new ConfigApp().getBaseConnection();
    }
}
