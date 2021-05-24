package nosi.webapps.igrp.pages.dominio;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import nosi.core.config.ConfigDBIGRP;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.DomainType;
import nosi.webapps.igrp.pages.dominio.Dominio.Formlist_1;

/**
 * Emanuel
 * 22 Mar 2019
 */
public class DomainHeper {

	// private static final String SQL_SIM_NAO = "SELECT 'ATIVE' as ID,'Ativo' as NAME UNION SELECT 'INATIVE' as ID,'Inativo' as NAME ";
	 public static final String SQL_DOMINIO_PRIVATE = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE env_fk=:env_fk";  //"AND domain_type='"+DomainType.PRIVATE+"'";
	 public static final String SQL_DOMINIO_PUB = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE env_fk is null"; // AND domain_type='"+DomainType.PUBLIC+"' OR domain_type is null ";		 		
	 public static final String SQL_ITEM_DOMINIO = "SELECT id as formlist_1_id,description,valor as key, case WHEN (status='ATIVE' OR status='') then '1' else '-1' END as estado, '1' as estado_check, ordem FROM tbl_domain "
	 		+ "WHERE dominio=:dominio AND env_fk=:env_fk";    //description is not null AND description!=''
	 public static final String SQL_ITEM_DOMINIO_PUB = "SELECT id as formlist_1_id,description,valor as key,case WHEN (status='ATIVE' OR status='') then 1 else -1 END as estado,1 as estado_check, ordem FROM tbl_domain "
		 		+ "WHERE dominio=:dominio AND env_fk is null";   
	 public static Map<Object, Object> getApplications() {
		return new Application().getListApps();
	}

	public static List <Dominio.Formlist_1> getDomainItemQuery(String dominio,Integer appId) {		
		/*
		if(Core.isNullOrZero(appId)) {
			return Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,SQL_ITEM_DOMINIO_PUB)
		   .addString("dominio", dominio)			 
		   .orderByAsc("ordem");	
		}else {
			return Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,SQL_ITEM_DOMINIO)
				   .addString("dominio", dominio)
				   .addInt("env_fk", appId)
				   .orderByAsc("ordem");
		}
			*/
		
		try{
			Domain domainfilter = new Domain().find().where("dominio", "=", dominio);
			if(Core.isNotNullOrZero(appId)) {
				domainfilter = domainfilter.andWhere("application", "=", appId);
			}
			
			List<Domain> domainfilterList = domainfilter.orderByAsc("ordem").all();
			List <Dominio.Formlist_1>  separatorlistDocs = new ArrayList<>(); 
			if ( Core.isNotNull(domainfilterList) ) {
					
					domainfilterList.forEach(domain -> {
						Dominio.Formlist_1 row = new Dominio.Formlist_1();
						row.setFormlist_1_id(new Pair( ""+domain.getId(), ""+domain.getId()));
						row.setDescription( new Pair(domain.getDescription(),domain.getDescription()) );
						row.setKey( new Pair(domain.getValor(),domain.getValor()) );
						row.setEstado( new Pair(domain.getStatus(),domain.getStatus()) );
						row.setOrdem( new Pair(domain.getordem()+"",domain.getordem()+"") );
						row.setEstado_check(new Pair("ATIVE","ATIVE"));
						separatorlistDocs.add(row);
					});
					
				}
			return separatorlistDocs;
			}catch ( Exception e ) {
				e.printStackTrace();
				return null;
			}
		
	}
	
	public static BaseQueryInterface getDomainQuery(Integer appId) {
		if(Core.isNullOrZero(appId))
			return Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,DomainHeper.SQL_DOMINIO_PUB);
		return Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,DomainHeper.SQL_DOMINIO_PRIVATE).addInt("env_fk", appId);
	}
	
	
	
//	public static BaseQueryInterface getEstadoQuery() {
//		return Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,DomainHeper.SQL_SIM_NAO);
//	}

	public static boolean saveDomain(Dominio model) {
		if (Core.isNotNull(model.getNovo_dominio())) {
			return !(new Domain(model.getNovo_dominio(), "", "", "ATIVE", 0,getDomainType(model.getAplicacao()==null?1:0) ,Core.isNullOrZero(model.getAplicacao())?null:Core.findApplicationById(model.getAplicacao())).insert().hasError());
		}
		return false;
	}
	private static DomainType getDomainType(int type) {
		DomainType domainType = DomainType.PRIVATE;
		if(type==1) {
			domainType = DomainType.PUBLIC;
		}
		return domainType;
	}
	private static boolean validateDomains(Formlist_1 formlist) {
		return Core.isNotNullMultiple(formlist.getKey().getKey(), formlist.getDescription().getKey());
	}

	public static boolean saveItemDomain(Dominio model) {
		boolean r = false;
		deleteOld(model);
		int order = 0;
		for(Formlist_1 d:model.getFormlist_1()) {
			if(validateDomains(d)) {
				if(Core.isNotNull(d.getFormlist_1_id()) && Core.isNotNull(d.getFormlist_1_id().getKey())) {
					if(!(r= update(d,(++order),model.getAplicacao()==null?1:0))) {
						break;
					}
				}else {
					if(!(r=insert(model,d,(++order))))
						break;
				}
			}
		}
		return r;
	}

	
	private static boolean insert(Dominio model,Formlist_1 formlist,int order) {
		Domain d = new Domain(model.getLst_dominio(),
				formlist.getKey().getKey(),
				formlist.getDescription().getKey(),
//				formlist.getEstado()!=null?formlist.getEstado().getKey().equals(formlist.getEstado_check()!=null?formlist.getEstado_check().getKey():null) ?"ATIVE":"INATIVE":
				formlist.getEstado().getKey().equals(formlist.getEstado_check().getKey())?"ATIVE":"INATIVE",
						order,
						getDomainType(model.getAplicacao()==null?1:0),
						Core.isNullOrZero(model.getAplicacao())?null:Core.findApplicationById(model.getAplicacao()));
		d = d.insert();
		if (d.hasError()) {
			d.showMessage();
			return false;
		}
		return true;
	}

	private static boolean update(Formlist_1 formlist,int order,int isPublico) {
		Domain d = new Domain().findOne(formlist.getFormlist_1_id().getKey());
		d.setDescription(formlist.getDescription().getKey());
		d.setStatus(formlist.getEstado().getKey().equals(formlist.getEstado_check().getKey())?"ATIVE":"INATIVE");
		d.setValor(formlist.getKey().getKey());
		d.setordem(order);
		d.setDomainType(getDomainType(isPublico));
		d = d.update();
		if (d.hasError()) {
			d.showMessage();
			return false;
		}
		return true;
	}

	private static void deleteOld(Dominio model) {
		String[] formlistDel = model.getP_formlist_1_del();
		if(formlistDel!=null) {
			for(String id:formlistDel) {
				Domain del = new Domain();
				if(del.findOne(id)!=null)
					{if (!del.delete(Core.toInt(id))) {
						Core.setMessageError("Delete error id=" + id);
					}}
				
				
			}
		}
	}
}
