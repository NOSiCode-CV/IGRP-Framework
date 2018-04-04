package nosi.base.ActiveRecord;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.EnumSet;

import javax.persistence.Entity;
import javax.persistence.MappedSuperclass;

import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AvailableSettings;
import org.hibernate.cfg.Configuration;
import org.hibernate.engine.jdbc.internal.Formatter;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.schema.TargetType;
import org.reflections.Reflections;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


import nosi.core.servlet.IgrpServlet;
import nosi.webapps.igrp.dao.*;
/**
 * Emanuel
 * 11 Dec 2017
 */
public class HibernateExporter {


	private static Logger log = LogManager.getLogger(HibernateExporter.class);	
    
//    private static Logger log = LoggerFactory.getLogger(HibernateExporter.class);
	private String dialect;
	private String entityPackage;

	private boolean generateCreateQueries = true;
	private boolean generateDropQueries = false;

	private Configuration hibernateConfiguration;

	public HibernateExporter(String dialect, String entityPackage) {
		this.dialect = dialect;
		this.entityPackage = entityPackage;

		hibernateConfiguration = createHibernateConfig();
	}

	public static void export(Connection connection) {
		MetadataSources metadata = new MetadataSources(
			    new StandardServiceRegistryBuilder()
			        .applySetting("hibernate.dialect", "org.hibernate.dialect.H2Dialect")
			        .applySetting("javax.persistence.schema-generation-connection", connection)
			        .build());

			metadata.addAnnotatedClass(Application.class);
			metadata.addAnnotatedClass(Action.class);
			metadata.addAnnotatedClass(CLob.class);
			metadata.addAnnotatedClass(Config_env.class);
			metadata.addAnnotatedClass(Config.class);
			metadata.addAnnotatedClass(ImportExportDAO.class);
			metadata.addAnnotatedClass(Menu.class);
			metadata.addAnnotatedClass(OAuthAccessToken.class);
			metadata.addAnnotatedClass(OAuthClient.class);
			metadata.addAnnotatedClass(OAuthorizationCode.class);
			metadata.addAnnotatedClass(OAuthRefreshToken.class);
			metadata.addAnnotatedClass(OAuthScope.class);
			metadata.addAnnotatedClass(Organization.class);
			metadata.addAnnotatedClass(Profile.class);
			metadata.addAnnotatedClass(ProfileType.class);
			metadata.addAnnotatedClass(RepInstance.class);
			metadata.addAnnotatedClass(RepSource.class);
			metadata.addAnnotatedClass(RepTemplate.class);
			metadata.addAnnotatedClass(RepTemplateParam.class);
			metadata.addAnnotatedClass(RepTemplateSource.class);
			metadata.addAnnotatedClass(Session.class);
			metadata.addAnnotatedClass(Transaction.class);
			metadata.addAnnotatedClass(User.class);
			metadata.addAnnotatedClass(UserRole.class);
			SchemaExport export = new SchemaExport();
			export.setOutputFile("igrp.sql");
			export.create(EnumSet.of(TargetType.DATABASE), metadata.buildMetadata());
	}
	public void export(OutputStream out, boolean generateCreateQueries, boolean generateDropQueries) {

//		Dialect hibDialect = Dialect.getDialect(hibernateConfiguration.getProperties());
//		try (PrintWriter writer = new PrintWriter(out)) {
//
//			if (generateCreateQueries) {
//				String[] createSQL = hibernateConfiguration.generateSchemaCreationScript(hibDialect);
//				write(writer, createSQL, FormatStyle.DDL.getFormatter());
//			}
//			if (generateDropQueries) {
//				String[] dropSQL = hibernateConfiguration.generateDropSchemaScript(hibDialect);
//				write(writer, dropSQL, FormatStyle.DDL.getFormatter());
//			}
//		}
	}

	public void export(File exportFile) throws FileNotFoundException {

		export(new FileOutputStream(exportFile), generateCreateQueries, generateDropQueries);
	}
	
	public void exportToConsole() {

		export(System.out, generateCreateQueries, generateDropQueries);
	}

	private void write(PrintWriter writer, String[] lines, Formatter formatter) {

		for (String string : lines)
			writer.println(formatter.format(string) + ";");
	}

	private Configuration createHibernateConfig() {

		hibernateConfiguration = new Configuration();

		final Reflections reflections = new Reflections(entityPackage);
		for (Class<?> cl : reflections.getTypesAnnotatedWith(MappedSuperclass.class)) {
			hibernateConfiguration.addAnnotatedClass(cl);
			log.info("Mapped = " + cl.getName());
		}
		for (Class<?> cl : reflections.getTypesAnnotatedWith(Entity.class)) {
			hibernateConfiguration.addAnnotatedClass(cl);
			log.info("Mapped = " + cl.getName());
		}
		hibernateConfiguration.setProperty(AvailableSettings.DIALECT, dialect);
		return hibernateConfiguration;
	}

	public boolean isGenerateDropQueries() {
		return generateDropQueries;
	}

	public void setGenerateDropQueries(boolean generateDropQueries) {
		this.generateDropQueries = generateDropQueries;
	}

	public Configuration getHibernateConfiguration() {
		return hibernateConfiguration;
	}

	public void setHibernateConfiguration(Configuration hibernateConfiguration) {
		this.hibernateConfiguration = hibernateConfiguration;
	}
}
