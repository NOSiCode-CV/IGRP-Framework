package nosi.core.db.migration.igrp.postgres;

import nosi.core.db.migration.igrp.IgrpMigrationTemplate;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * Igrpweb yo
 * jan 17, 2024
 */
public class R__igrp extends IgrpMigrationTemplate{

	@Override
	public void app() {
	  this.app = new Application("igrp", "IGRP", "igrp.svg", "Integrated Government Resource Planning", 1, null,"null");
	}

	@Override
	public void pages() {
	  this.actions.add(new Action("Task", "index", "nosi.webapps.igrp.pages", "igrp/task/Task.xsl", "Task", "Task", "2.3", 1, this.app, (short)0, null, null, (short)0));
	}

	@Override
	public void transactions() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void domains() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void dbConnections() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void reports() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void bpmns() {
		// Not implemented yet... Put your code here!
	}

	@Override
	public void documentTypes() {
		// Not implemented yet... Put your code here!
	}


	@Override
	public Integer getChecksum() {
		return 195936636;
	}

}