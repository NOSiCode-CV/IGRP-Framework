package nosi.core.webapp.import_export_v2.imports.report;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.report.CLobSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportParamsSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.webapps.igrp.dao.User;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class ReportImport  extends AbstractImport implements IImport{

	private List<ReportSerializable> reports;
	private Application application;
	
	public ReportImport(Application application) {
		this.application = application;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.reports = (List<ReportSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<ReportSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.reports!=null) {
			this.reports.stream().forEach(report->{
				RepTemplate repTemplate = new RepTemplate().find().andWhere("report_identify", "=",report.getReport_identify()).one();
				CLob xml_content = this.getClob(report.getXml_content());
				CLob xsl_content = this.getClob(report.getXsl_content());
				if(repTemplate==null) {
					repTemplate = new RepTemplate();
					repTemplate.setCode(report.getCode());
					repTemplate.setDt_created(report.getDt_created());
					repTemplate.setDt_updated(report.getDt_updated());
					repTemplate.setName(report.getName());
					repTemplate.setReport_identify(report.getReport_identify());					
					repTemplate.setApplication(this.application!=null?this.application:new Application().findByDad(report.getDad()));
					repTemplate.setUser_created(new User().findIdentityByUsername(report.getUsername_created()));
					repTemplate.setUser_updated(new User().findIdentityByUsername(report.getUsername_updated()));
					repTemplate.setStatus(report.getStatus());
					repTemplate.setXml_content(xml_content);
					repTemplate.setXsl_content(xsl_content);
					repTemplate = repTemplate.insert();
					this.addError(repTemplate.hasError()?repTemplate.getError().get(0):null);
					this.saveDataSource(report);
					this.saveParamDataSource(report,repTemplate);
				}
			});
		}
	}

	private void saveParamDataSource(ReportSerializable report, RepTemplate repTemplate) {
		if(report.getSourcesReportAssoc()!=null) {
			report.getSourcesReportAssoc().stream().forEach(pds->{
				RepTemplateSource repTS = new RepTemplateSource();
				RepSource repSource = new RepSource().find().andWhere("source_identify", "=",pds.getSource()).one();
				repTS.setRepSource(repSource);
				repTS.setRepTemplate(repTemplate);
				repTS = repTS.insert();
				this.addError(repTS.hasError()?repTS.getError().get(0):null);
				if(pds.getParams()!=null) {
					for(ReportParamsSerializable p:pds.getParams()){
						RepTemplateSourceParam param = new RepTemplateSourceParam();
						param.setParameter(p.getParameter());
						param.setParameter_type(p.getParameter_type());
						param.setRepTemplateSource(repTS);
						param = param.insert();
						this.addError(param.hasError()?param.getError().get(0):null);
					}
				}
			});
		}
	}

	private void saveDataSource(ReportSerializable report) {
		if(report.getSources()!=null) {
			report.getSources().stream().forEach(source->{
				Config_env config = new Config_env().find().andWhere("connection_identify", "=",source.getConnection_name_identify()).one();
				RepSource repSource = new RepSource();
				Application app = new Application().findByDad(source.getDad());
				repSource.setApplication(app);
				repSource.setApplication_source(app);
				repSource.setConfig_env(config);
				repSource.setDt_created(source.getDt_created());
				repSource.setDt_updated(source.getDt_updated());
				repSource.setSource_identify(source.getSource_identify());
				repSource.setName(source.getName());
				repSource.setType_query(source.getType_query());
				repSource.setType_fk(source.getType_fk());
				repSource.setType_name(source.getType_name());
				repSource.setType(source.getType());
				repSource.setTaskid(source.getTaskid());
				repSource.setFormkey(source.getFormkey());
				repSource.setProcessid(source.getProcessid());
				repSource.setStatus(source.getStatus());
				repSource.setUser_created(new User().findIdentityByUsername(source.getUsername_created()));
				repSource.setUser_updated(new User().findIdentityByUsername(source.getUsername_updated()));
				repSource = repSource.insert();
				this.addError(repSource.hasError()?repSource.getError().get(0):null);
			});
		}
	}

	private CLob getClob(CLobSerializable report) {
		if(report!=null) {
			CLob clob = new CLob(report.getName(), report.getMime_type(), report.getC_lob_content(), report.getDt_created());
			clob = clob.insert();
			this.addError(clob.hasError()?clob.getError().get(0):null);
			return clob;
		}
		return null;
	}


}
