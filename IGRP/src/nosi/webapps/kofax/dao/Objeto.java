package nosi.webapps.kofax.dao;

import java.io.Serializable;

import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.webapps.igrp.dao.Organization;

/**
 * Yma
 * 14 Aug 2017
 */
public class Objeto extends BaseActiveRecord<Objeto> implements Serializable{

	private Integer id;
	private Organization organica;
	private String objeto;
	
}
