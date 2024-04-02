package nosi.webapps.igrp.pages.dominio;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import nosi.core.config.ConfigApp;
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

	private DomainHeper(){
	}

	 public static final String SQL_DOMINIO_PRIVATE = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE env_fk=:env_fk";  //"AND domain_type='"+DomainType.PRIVATE+"'";
	 public static final String SQL_DOMINIO_PUB = "SELECT DISTINCT dominio as id, dominio FROM tbl_domain WHERE env_fk is null"; // AND domain_type='"+DomainType.PUBLIC+"' OR domain_type is null ";		 		
	 public static final String SQL_ITEM_DOMINIO = "SELECT id as formlist_1_id,description,valor as key, case WHEN (status='ATIVE' OR status='') then '1' else '-1' END as estado, '1' as estado_check, ordem FROM tbl_domain "
	 		+ "WHERE dominio=:dominio AND env_fk=:env_fk";    //description is not null AND description!=''
	 public static final String SQL_ITEM_DOMINIO_PUB = "SELECT id as formlist_1_id,description,valor as key,case WHEN (status='ATIVE' OR status='') then 1 else -1 END as estado,1 as estado_check, ordem FROM tbl_domain "
		 		+ "WHERE dominio=:dominio AND env_fk is null";   
	 public static Map<Object, Object> getApplications() {
		return new Application().getListApps();
	}

	public static List<Dominio.Formlist_1> getDomainItemQuery(String dominio,Integer appId) {
		try{
			Domain domainfilter = new Domain().find().where("dominio", "=", dominio);
			if(Core.isNotNullOrZero(appId))
				domainfilter = domainfilter.andWhere("application", "=", appId);
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
				return new ArrayList<>(0);
			}
	}
	
	public static BaseQueryInterface getDomainQuery(Integer appId) {
		
		if(Core.isNullOrZero(appId))
			return Core.query(ConfigApp.getInstance().getBaseConnection(), DomainHeper.SQL_DOMINIO_PUB);
		return Core.query(ConfigApp.getInstance().getBaseConnection(), DomainHeper.SQL_DOMINIO_PRIVATE).addInt("env_fk", appId);
	}

	public static boolean saveDomain(Dominio model) {
		final String domainName = model.getNovo_dominio().trim();
		if (Core.isNotNull(domainName)) {
			return !(new Domain(domainName, "", "", "ATIVE", 0,getDomainType(model.getAplicacao() == null?1:0) ,Core.isNullOrZero(model.getAplicacao())?null:Core.findApplicationById(model.getAplicacao())).insert().hasError());
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
		return Core.isNotNullMultiple(formlist.getKey().getKey().trim(), formlist.getDescription().getKey().trim());
	}

	public static boolean saveItemDomain(Dominio model) {

		var success = false;

		printDomainsWarningMessagesWithSameDescription(model.getFormlist_1());

		final var domainsWithSameKey = getDomainsWithSameKey(model.getFormlist_1());
		if (!domainsWithSameKey.isEmpty()) {
			domainsWithSameKey.forEach((key, value) -> {
               final var descriptions = value.stream().map(o -> o.getDescription().getKey().trim()).collect(Collectors.joining(", "));
               Core.setMessageWarning("Foram encontradas chaves repetidas. Chave: [ <strong>%s</strong> ] Descrições: [ <strong>%s</strong> ]".formatted(key, descriptions));
            });
			return success;
		}

		deleteOld(model);
		int order = 0;

		for (Formlist_1 d : model.getFormlist_1()) {
			if (validateDomains(d)) {
				if (Core.isNotNull(d.getFormlist_1_id()) && Core.isNotNull(d.getFormlist_1_id().getKey())) {
					if (!(success = update(d, (++order), model.getAplicacao() == null ? 1 : 0)))
						break;
				} else {
					if (!(success = insert(model, d, (++order))))
						break;
				}
			}
		}
		return success;
	}

	private static void printDomainsWarningMessagesWithSameDescription(List<Formlist_1> values) {
		values.stream()
				.collect(Collectors.groupingBy(obj -> obj.getDescription().getKey().trim()))
				.entrySet()
				.stream()
				.filter(obj -> obj.getValue().size() > 1)
				.forEach(obj -> {
					final var keys = obj.getValue().stream().map(o -> o.getKey().getKey()).collect(Collectors.joining(", "));
					Core.setMessageWarning("Foram encontradas descrições repetidas. Descrição: [ <strong>%s</strong> ] Chaves: [ <strong>%s</strong> ]".formatted(obj.getKey(), keys));
				});
	}

	private static Map<String, List<Formlist_1>> getDomainsWithSameKey(List<Formlist_1> values) {
		return values.stream()
				.collect(Collectors.groupingBy(obj -> obj.getKey().getKey().trim()))
				.entrySet()
				.stream()
				.filter(obj -> obj.getValue().size() > 1)
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}
	
	private static boolean insert(Dominio model,Formlist_1 formlist,int order) {
		Domain d = new Domain(model.getLst_dominio(),
				formlist.getKey().getKey().trim(),
				formlist.getDescription().getKey().trim(),
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
		d.setDescription(formlist.getDescription().getKey().trim());
		d.setStatus(formlist.getEstado().getKey().equals(formlist.getEstado_check().getKey())?"ATIVE":"INATIVE");
		d.setValor(formlist.getKey().getKey().trim());
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
				if(del.findOne(id)!=null && !del.delete(Core.toInt(id)))
					Core.setMessageError("Delete error id=" + id);
			}
		}
	}
}
