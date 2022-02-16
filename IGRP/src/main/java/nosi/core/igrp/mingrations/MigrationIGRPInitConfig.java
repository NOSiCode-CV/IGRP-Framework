package nosi.core.igrp.mingrations;

/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */

import java.util.Map;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.db.migration.igrp.IgrpMigrationAPI;

import org.hibernate.cfg.Environment;

public class MigrationIGRPInitConfig {
	
	public static void start() {
		Map<String, Object> configs = HibernateUtils.REGISTRY_BUILDER_IGRP.getAggregatedCfgXml().getConfigurationValues();
		new IgrpMigrationAPI((String) configs.get(Environment.URL), (String) configs.get(Environment.USER), (String) configs.get(Environment.PASS))
			.configureNLoad()
			.migrate();
	}
}
