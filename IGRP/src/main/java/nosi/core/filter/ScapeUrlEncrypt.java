package nosi.core.filter;

import java.util.HashMap;
import java.util.Map;

/**
 * Emanuel
 * 25 Feb 2018
 */
public final class ScapeUrlEncrypt {

	public static Map<String,String> getScapeUrl(){
		Map<String,String> m = new HashMap<>();
		m.put("igrp/error-page/exception", "Error Exception");
		m.put("igrp/page/getPageJson", "Json Configuration Page");
		m.put("igrp/page/detailPage", "Page Detail");
		m.put("igrp/page/listPage","List Page for ComboBox Generator");
		m.put("igrp/page/listService", "List Services");
		m.put("igrp/page/imageList", "List Images");
		m.put("igrp/page/preserveUrl", "Url Preserve Code Java");
		m.put("igrp/page/listDomains", "List Domain");
		m.put("link_domains_value", "Domains Value");
		return m;
	}
}
