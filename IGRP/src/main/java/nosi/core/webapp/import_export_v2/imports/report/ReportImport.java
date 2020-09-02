package nosi.core.webapp.import_export_v2.imports.report;

import java.util.List;
import com.google.gson.reflect.TypeToken;

import nosi.core.config.ConfigDBIGRP;
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
						.andWhere("report_identify", "=", report.getReport_identify()).one();
				CLob xml_content = this.getClob(report.getXml_content(), report.getDad());
				CLob xsl_content = this.getClob(report.getXsl_content(), report.getDad());
				if (repTemplate == null) {
					repTemplate = new RepTemplate();
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
					repTemplate = repTemplate.insert();
				} else {
					repTemplate.setCode(report.getCode());
					repTemplate.setDt_created(report.getDt_created());
					repTemplate.setDt_updated(report.getDt_updated());
					repTemplate.setName(report.getName());
					repTemplate.setApplication(
							this.application != null ? this.application : new Application().findByDad(report.getDad()));
					
					repTemplate.setUser_updated(Core.getCurrentUser());
					repTemplate.setStatus(report.getStatus());
					repTemplate.setXml_content(xml_content);
					repTemplate.setXsl_content(xsl_content);
					repTemplate = repTemplate.update();
				}
				this.addError(repTemplate.hasError() ? repTemplate.getError().get(0) : null);
				this.saveDataSource(report);
				this.saveParamDataSource(report, repTemplate);
			});
		}
	}
	
	private void deleteTemplateSource(RepTemplate repTemplate) { 
		List<RepTemplateSource> repTS = new RepTemplateSource().find().andWhere("repTemplate", "=", repTemplate).all();
		if(repTS != null) { 
			repTS.forEach(obj->{
				Core.delete(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG ,"public", "tbl_rep_template_source_param").where("rep_template_source_fk=:rep_template_source_fk")
				.addInt("rep_template_source_fk", obj.getId())
				.execute();
			}); 
		}
		Core.delete(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG ,"public", "tbl_rep_template_source").where("rep_template_fk=:rep_template_fk")
		.addInt("rep_template_fk", repTemplate.getId())
		.execute();
	}

	private void saveParamDataSource(ReportSerializable report, RepTemplate repTemplate) {
		if (report.getSourcesReportAssoc() != null) {
			deleteTemplateSource(repTemplate); 
			report.getSourcesReportAssoc().stream().forEach(pds -> {
				RepSource repSource = new RepSource().find().andWhere("source_identify", "=", pds.getSource()).one();
				RepTemplateSource repTS = new RepTemplateSource().find().andWhere("repSource", "=", repSource)
						.andWhere("repTemplate", "=", repTemplate)
						.one();
				if(repSource!=null) {
				if(repTS==null) {
					repTS = new RepTemplateSource();
					repTS.setRepSource(repSource);
					repTS.setRepTemplate(repTemplate);
					repTS = repTS.insert();
					this.addError(repTS.hasError() ? repTS.getError().get(0) : null);
				}
				if (pds.getParams() != null) {
					for (ReportParamsSerializable p : pds.getParams()) {
						if (new RepTemplateSourceParam().find().andWhere("parameter", "=", p.getParameter())
								.andWhere("parameter_type", "=", p.getParameter_type())
								.andWhere("repTemplateSource", "=", repTS).getCount() == 0) {
							RepTemplateSourceParam param = new RepTemplateSourceParam();
							param.setParameter(p.getParameter());
							param.setParameter_type(p.getParameter_type());
							param.setRepTemplateSource(repTS);
							param = param.insert();
							this.addError(param.hasError() ? param.getError().get(0) : null);
						}
					}
				}
				}
			});
		}
	}

	private void saveDataSource(ReportSerializable report) {
		if (report.getSources() != null) {
			report.getSources().stream().forEach(source -> {
				Config_env config = new Config_env().find()
						.andWhere("connection_identify", "=", source.getConnection_name_identify()).one();
				if(config != null) {
					RepSource repSource = new RepSource().find()
							.andWhere("source_identify", "=", source.getSource_identify()).one();
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
				}else {
					Core.setMessageError("[Report] Error importing datasource "+source.getName()+" - connection not found with connection_identify="+source.getConnection_name_identify()+". Please import this connection database. ");
					this.addError("Import error "+source.getName()+"; ");	
	}

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
			Action ac = new Action().findByPage(appPage[1],appPage[0]);
			if(ac != null) {
				repSource.setType_fk(ac.getId());
			}
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
					report.getDt_created(), Core.findApplicationByDad(dad));
			clob = clob.insert();
			this.addError(clob.hasError() ? clob.getError().get(0) : null);
			return clob;
		}
		return null;
	}

}
