package nosi.core.webapp.import_export_v2.exports.report;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportParamsSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSourceAssocSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.report.ReportSourcesSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;

/**
 * Emanuel
 * 29 Oct 2018
 */
public class ReportExport implements IExport{

	private List<ReportSerializable> reports;

	public ReportExport() {
		this.reports = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.REPORT.getFileName();
	}
	
	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.reports);
	}

	@Override
	public void add(String id) {
		ReportSerializable report = new ReportSerializable();
		RepTemplate repTemplate = new RepTemplate().findOne(Core.toInt(id));
		List<ReportSourcesSerializable> sources = this.getSources(repTemplate);
		List<ReportSourceAssocSerializable> sourcesReportAssoc = this.getSourceReportAssoc(repTemplate);
		Core.mapper(repTemplate, report);
		report.setDad(repTemplate.getApplication().getDad());
		report.setUsername_created(repTemplate.getUser_created()!=null?repTemplate.getUser_created().getUser_name():"");
		report.setUsername_updated(repTemplate.getUser_updated()!=null?repTemplate.getUser_updated().getUser_name():"");
		report.setSources(sources);
		report.setSourcesReportAssoc(sourcesReportAssoc);
		this.reports.add(report);
	}


	private List<ReportSourceAssocSerializable> getSourceReportAssoc(RepTemplate repTemplate) {
		List<ReportSourceAssocSerializable> list = new ArrayList<>();
		List<RepTemplateSource> sources = new RepTemplateSource()
				 .find()
				 .andWhere("repTemplate","=",repTemplate.getId())
				 .all();
		if(sources!=null) {
			sources.stream().forEach(s->{
				ReportSourceAssocSerializable e = new ReportSourceAssocSerializable();
				e.setReport(s.getRepTemplate().getReport_identify());
				e.setSource(s.getRepSource().getSource_identify());
				List<ReportParamsSerializable> params = new ArrayList<>();
				if(s.getParameters()!=null) {
					s.getParameters().stream().forEach(param->{
						ReportParamsSerializable p = new ReportParamsSerializable();
						p.setParameter(param.getParameter());
						p.setParameter_type(param.getParameter_type());
						params.add(p);
					});
				}
				e.setParams(params);
				list.add(e);
			});
		}
		return list;
	}

	private List<ReportSourcesSerializable> getSources(RepTemplate repTemplate) {
		List<ReportSourcesSerializable> list = new ArrayList<>();
		List<RepTemplateSource> sources = new RepTemplateSource()
				 .find()
				 .andWhere("repTemplate","=",repTemplate.getId())
				 .all();
		if(sources!=null) {
			sources.stream().forEach(s->{				
				ReportSourcesSerializable e = new ReportSourcesSerializable();
				Core.mapper(s.getRepSource(), e);
				e.setUsername_created(s.getRepSource().getUser_created()!=null?s.getRepSource().getUser_created().getUser_name():"");
				e.setUsername_updated(s.getRepSource().getUser_updated()!=null?s.getRepSource().getUser_updated().getUser_name():"");
				e.setDad(s.getRepSource().getApplication().getDad());
				e.setConnection_name_identify(s.getRepSource().getConfig_env()!=null?s.getRepSource().getConfig_env().getConnection_identify():"");
				list.add(e);
			});
		}
		return list;
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				if(Core.isNotNull(id))
					this.add(id);
			}
			export.add(this);
		}
	}

}
