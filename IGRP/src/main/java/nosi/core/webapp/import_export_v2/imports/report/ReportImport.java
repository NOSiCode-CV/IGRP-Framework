package nosi.core.webapp.import_export_v2.imports.report;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.report.CLobSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportParamsSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSourcesSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel 2 Nov 2018
 */
public class ReportImport extends AbstractImport implements IImport {

	private List<ReportSerializable> reports;
	private Application application;

	public ReportImport(Application application) {
		this.application = application;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if (Core.isNotNull(jsonContent)) {
			this.reports = (List<ReportSerializable>) Core.fromJsonWithJsonBuilder(jsonContent,
					new TypeToken<List<ReportSerializable>>() {
					}.getType());
		}
	}

	@Override
	public void execute() {
		if (this.reports != null) {
			this.reports.stream().forEach(report -> {
				RepTemplate repTemplate = new RepTemplate().find()
						.where("report_identify", "=", report.getReport_identify()).one();
				if (repTemplate == null) {
					repTemplate = new RepTemplate();
					this.mapRepTemplate(repTemplate, report);
					repTemplate = repTemplate.insert();
				} else {
					this.mapRepTemplate(repTemplate, report);
					repTemplate = repTemplate.update();
				}
				this.addError(repTemplate.hasError() ? repTemplate.getError().get(0) : null);
				this.saveDataSource(report,repTemplate);
			});
		}
	}

	private void saveAssocReportToDataSource(ReportSerializable report, RepSource repSource, RepTemplate repTemplate) {		
		report.getSourcesReportAssoc().forEach(repAssoc->{
			RepTemplateSource assoc = new RepTemplateSource().find()
					.where("repTemplate","=",repTemplate.getId())
					.andWhere("repSource","=",repSource.getId())
					.one();
			if(assoc==null) {
				assoc = new RepTemplateSource();
				assoc.setRepSource(repSource);
				assoc.setRepTemplate(repTemplate);
				assoc = assoc.insert();
				List<ReportParamsSerializable> params = repAssoc.getParams();
				if(params != null) {
					for(ReportParamsSerializable param:params) {
						RepTemplateSourceParam p = new RepTemplateSourceParam();
						p.setParameter(param.getParameter());
						p.setParameter_type(param.getParameter_type());
						p.setRepTemplateSource(assoc);
						p.insert();
					}
				}
				this.addError(assoc.hasError() ? assoc.getError().get(0) : null);
			}
		});
	}

	private void mapRepTemplate(RepTemplate repTemplate,ReportSerializable report){
		CLob xml_content = this.getClob(report.getXml_content(), report.getDad());
		CLob xsl_content = this.getClob(report.getXsl_content(), report.getDad());
		repTemplate.setCode(report.getCode());
		repTemplate.setDt_created(report.getDt_created());
		repTemplate.setDt_updated(report.getDt_updated());
		repTemplate.setName(report.getName());
		repTemplate.setReport_identify(report.getReport_identify());
		repTemplate.setApplication(
				this.application != null ? this.application : new Application().findByDad(report.getDad()));
		repTemplate.setUser_created(Core.getCurrentUser());
		repTemplate.setUser_updated(Core.getCurrentUser());
		repTemplate.setStatus(report.getStatus());
		repTemplate.setXml_content(xml_content);
		repTemplate.setXsl_content(xsl_content);
	}

	private void saveDataSource(ReportSerializable report, RepTemplate repTemplate) {
		List<ReportSourcesSerializable> sources = report.getSources();
		if (sources != null) {
			sources.forEach(source -> {
				Config_env config = new Config_env()
						.find()
						.where("name", "=", source.getConnection_name_identify())
						.andWhere("application.dad","=",source.getDad())
						.one();

				RepSource repSource = new RepSource().find()
						.where("name", "=", source.getName())
						.andWhere("application.dad","=",source.getDad())
						.andWhere("type","=",source.getType())
						.one();
				
				Application app = new Application().findByDad(source.getDad());
				if (repSource == null) {					
					repSource = new RepSource();
					repSource.setDt_created(source.getDt_created());
					repSource.setSource_identify(source.getSource_identify());
					repSource.setUser_created(Core.getCurrentUser());					
					mapper(source, config, repSource, app);
					repSource = repSource.insert();
					this.addError(repSource.hasError() ? repSource.getError().get(0) : null);
				} else {
					mapper(source, config, repSource, app);
					repSource = repSource.update();
					this.addError(repSource.hasError() ? repSource.getError().get(0) : null);
				}
				this.saveAssocReportToDataSource(report,repSource,repTemplate);
			});
		}
	}

	private void mapper(ReportSourcesSerializable source, Config_env config, RepSource repSource, Application app) {
		repSource.setApplication(app);
		repSource.setApplication_source(app);
		repSource.setConfig_env(config);					
		repSource.setDt_updated(source.getDt_updated());				
		repSource.setName(source.getName());
		repSource.setType_query(source.getType_query());
		if(source.getType_name().equals("Page") && source.getType_query()!=null) {
			String[] appPage = source.getType_query().split("::");
			repSource.setType_fk(new Action().findByPage(appPage[1],appPage[0]).getId());
		}else {
			repSource.setType_fk(source.getType_fk());
		}
		repSource.setType_name(source.getType_name());
		repSource.setType(source.getType());
		repSource.setTaskid(source.getTaskid());
		repSource.setFormkey(source.getFormkey());
		repSource.setProcessid(source.getProcessid());
		repSource.setStatus(source.getStatus());			
		repSource.setUser_updated(Core.getCurrentUser());
	}

	private CLob getClob(CLobSerializable report, String dad) {
		if (report != null) {
			CLob clob = new CLob(report.getName(), report.getMime_type(), report.getC_lob_content(),
					report.getDt_created(), new Application().findByDad(dad));
			clob = clob.insert();
			this.addError(clob.hasError() ? clob.getError().get(0) : null);
			return clob;
		}
		return null;
	}

}
