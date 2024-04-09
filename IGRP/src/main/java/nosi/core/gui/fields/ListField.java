package nosi.core.gui.fields;

import static java.util.Optional.ofNullable;
import static nosi.core.i18n.Translator.gt;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.Tuple;

import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.Domain;

/**
 * @author: Emanuel Pereira
 * <p>
 *          Apr 13, 2017
 *
 *          Description: class to configure list field
 */

public class ListField extends AbstractField {

	public ListField(Object model, String name) {
		super();
		this.setName(name);
		this.propertie().put("type", "select");
		this.propertie().put("name", "p_" + name);
		this.propertie().put("multiple", Boolean.FALSE);
		this.propertie().put("right", Boolean.FALSE);
		this.propertie().put("disabled", Boolean.FALSE);
		this.propertie().put("maxlength", 30);
		this.propertie().put("change", Boolean.FALSE);
		this.propertie().put("required", Boolean.FALSE);
		this.setTagName(name);
		this.configValue(model);
		ofNullable(this.propertie()).ifPresent(prop -> prop.put("value", this.getValue()));
	}

	@Override
	protected void configValue(Object model) {
		try {
			// Check first if select field is initialized with domains (For BPMN purpose) 
			String hasDomain = (String) this.propertie().get("domain"); 
			if(Core.isNotNull(hasDomain) && (this.getListOptions() == null || this.getListOptions().isEmpty())) {
				if(hasDomain.contains("«")) {
					String[] aux = hasDomain.split(" « ");
					String domainName = aux[0].trim(); 
					String appName = aux[1].trim(); 
					if(this.propertie().getProperty("type").equals("radiolist") || this.propertie().getProperty("type").equals("checkboxlist"))
						this.loadDomainByApp(domainName, appName);
					else
						this.loadDomain(domainName, appName, "-- Selecionar --");
				}else {
					if(this.propertie().getProperty("type").equals("radiolist") || this.propertie().getProperty("type").equals("checkboxlist"))
						this.loadDomain(hasDomain);
					else
						this.loadDomain(hasDomain, "-- Selecionar --");
				}
			}
		} catch (Exception ignored) {
		}
		if ( (this.propertie().get("multiple") != null && this.propertie().get("multiple").equals("true")) || this.propertie().getProperty("type").equals("checkboxlist")) {
			this.setValue(IgrpHelper.getValueArray(model, this.getName()));
		} else
			this.setValue(IgrpHelper.getValue(model, this.getName()));
	}

	@Override
	public void setQuery(BaseQueryInterface query, String prompt) {
		Map<Object, String> map = new LinkedHashMap<>();
		if (prompt != null)
			map.put(null, gt(prompt));
		List<Tuple> list = query.getResultList();
		if (list != null && !list.isEmpty()) {
			for (Tuple t : list) {
				try {
					map.put(t.get(0), gt(""+t.get(1)));
				} catch (IllegalArgumentException e) {
					Core.log("ListField.setQuery IllegalArgumentException");
				}
			}
			this.setValue(map);
		}
	}

	@Override
	public void setQuery(BaseQueryInterface query) {
		this.setQuery(query, null);
	}

	@Override
	public void setDefaultValue(Object defaultValue) {
		this.propertie().put("value", defaultValue);
	}

	@Override
	public void loadDomain(String domains) {
		this.loadDomain(domains, null);
	}
	
	@Override
	public void loadDomainByApp(String domains, String codeApp) {
		this.loadDomain(domains,codeApp, null);
	}

	@Override
	public void loadDomain(String domains, String prompt) {
		Map<Object, String> map = new LinkedHashMap<>();
		if (prompt != null)
			map.put(null, gt(prompt));
		// To skip error "incompatible types: inferred type does not conform to upper bound(s) inferred..."
		Map<Object, String> resultMap = Core.findDomainByCode(domains).stream().collect(Collectors.toMap(Domain::getValor, x -> gt(x.getDescription()),(oldValue, newValue) -> oldValue, LinkedHashMap<Object, String>::new));
		map.putAll(resultMap);
		this.setValue(map);
	}

	@Override
	public void loadDomain(String domains,String codeApp, String prompt) {
		Map<Object, String> map = new LinkedHashMap<>();
		if (prompt != null)
			map.put(null, gt(prompt));
		// To skip error "incompatible types: inferred type does not conform to upper bound(s) inferred..."
		Map<Object, String> resultMap = Core.findDomainByCode(domains,codeApp).stream().collect(Collectors.toMap(Domain::getValor, x -> gt(x.getDescription()),(oldValue, newValue) -> oldValue, LinkedHashMap<Object, String>::new));
		map.putAll(resultMap);
		this.setValue(map);
	}
}
