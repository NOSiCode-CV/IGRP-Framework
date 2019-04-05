package nosi.webapps.igrp.pages.dominio;


import java.util.Map;
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

	 private static final String SQL_SIM_NAO = "SELECT 'ATIVE' as ID,'Ativo' as NAME UNION SELECT 'INATIVE' as ID,'Inativo' as NAME ";
	 public static final String SQL_DOMINIO_PRIVATE = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE description is null or description='' AND env_fk=:env_fk AND domain_type='"+DomainType.PRIVATE+"'";
	 public static final String SQL_DOMINIO_PUB = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE description is null or description='' AND domain_type='"+DomainType.PUBLIC+"' OR domain_type is null ";
		 		
	 public static final String SQL_ITEM_DOMINIO = "SELECT id as formlist_1_id,description,valor as key,status as estado,ordem FROM tbl_domain WHERE description is not null AND description!='' AND dominio=:dominio";
	
	 public static Map<Object, Object> getApplications() {
		return new Application().getListApps();
	}

	public static BaseQueryInterface getDomainItemQuery(String dominio) {
		return Core.query(SQL_ITEM_DOMINIO)
				   .addString("dominio", dominio)
				   .orderByAsc("ordem");	
	}
	
	public static BaseQueryInterface getDomainQuery(Integer appId) {
		if(appId==0)
			return Core.query(DomainHeper.SQL_DOMINIO_PUB);
		return Core.query(DomainHeper.SQL_DOMINIO_PRIVATE).addInt("env_fk", appId);
	}
	
	
	
	public static BaseQueryInterface getEstadoQuery() {
		return Core.query(DomainHeper.SQL_SIM_NAO);
	}

	public static boolean saveDomain(Dominio model) {
		if (Core.isNotNull(model.getNovo_dominio())) {
			return !(new Domain(model.getNovo_dominio(), "", "", "", 0,getDomainType(model.getPublico()) ,new Application().findOne(model.getAplicacao())).insert().hasError());
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
		return Core.isNotNullMultiple(formlist.getKey().getKey(), formlist.getDescription().getKey(),
				formlist.getDescription().getKey());
	}

	public static boolean saveItemDomain(Dominio model) {
		boolean r = false;
		deleteOld(model);
		int order = 0;
		for(Formlist_1 d:model.getFormlist_1()) {
			if(validateDomains(d)) {
				if(Core.isNotNull(d.getFormlist_1_id()) && Core.isNotNull(d.getFormlist_1_id().getKey())) {
					if(!(r= update(d,(++order)))) {
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
		Domain d = new Domain(model.getLst_dominio(), formlist.getKey().getKey(),
				formlist.getDescription().getKey(), formlist.getEstado().getKey(),order,getDomainType(model.getPublico()),new Application().findOne(model.getAplicacao()));
		d = d.insert();
		if (d.hasError()) {
			d.showMessage();
			return false;
		}
		return true;
	}

	private static boolean update(Formlist_1 formlist,int order) {
		Domain d = new Domain().findOne(formlist.getFormlist_1_id().getKey());
		d.setDescription(formlist.getDescription().getKey());
		d.setStatus(formlist.getEstado().getKey());
		d.setValor(formlist.getKey().getKey());
		d.setordem(order);
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
				if (!del.delete(Core.toInt(id))) {
					Core.setMessageError("Delete error id=" + id);
				}
			}
		}
	}
}
