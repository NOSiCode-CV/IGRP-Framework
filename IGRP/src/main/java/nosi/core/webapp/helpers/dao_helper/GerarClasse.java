package nosi.core.webapp.helpers.dao_helper;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Stream;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.text.CaseUtils;
import org.hibernate.annotations.Immutable;

import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.Connection;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp_studio.pages.crudgenerator.CRUDGeneratorController;

/**
 * Isaias.Nunes Aug 22, 2019
 */
public class GerarClasse {

	private DaoDto daoDto;
	private StringBuilder imports;
	private StringBuilder variables;
	private StringBuilder gettersSetters;
	private String columnType;
	private String pascalCaseColumnName;
	private String camelCaseColumnName;
	private static final String NEW_LINE = "\n";
	private static final String TAB = "\t";

	public GerarClasse(DaoDto daoDto) {
		this.daoDto = daoDto;
		this.imports = new StringBuilder();
		this.variables = new StringBuilder();
		this.gettersSetters = new StringBuilder();
	}

	public String generate() throws SQLException, IOException {

		List<Column> columns = DatabaseMetadaHelper.getCollumns(this.daoDto.getConfigEnv(), this.daoDto.getSchema(),
				this.daoDto.getTableName());

		this.addImports(columns::stream);

		for (DatabaseMetadaHelper.Column column : columns) {

			this.updateColumnsInfos(column);

			if (column.isPrimaryKey())
				this.doIfColumnIsPrimaryKey(column);

			else if (column.isForeignKey()) {

				this.doIfColumnIsForeignKey(column);

				if (!Core.fileExists(new Config().getPathDAO(this.daoDto.getDadName()).concat(columnType)
						.concat(CRUDGeneratorController.JAVA_EXTENSION))) {
					this.daoDto.setContentList(
							this.generateVariableTypeList(this.daoDto.getDaoClassName(), camelCaseColumnName));
					this.daoDto.setContentListSetGet(
							this.generateVariableTypeListGetterSetter(this.daoDto.getDaoClassName()));
					this.daoDto.setHasList(true);

					DaoDto newDaoDto = new DaoDto();
					newDaoDto.setConfigEnv(this.daoDto.getConfigEnv());
					newDaoDto.setSchema(this.daoDto.getSchema());
					newDaoDto.setDadName(this.daoDto.getDadName());
					newDaoDto.setHasList(this.daoDto.hasList());
					newDaoDto.setContentList(this.daoDto.getContentList());
					newDaoDto.setContentListSetGet(this.daoDto.getContentListSetGet());
					newDaoDto.setTableName(column.getTableRelation());
					newDaoDto.setTableType(this.daoDto.getTableType());
					newDaoDto.setJavaUtilDate(this.daoDto.isJavaUtilDate());
					newDaoDto.setDaoClassName(columnType);
					new CRUDGeneratorController().generateDAO(newDaoDto);
				}

			} else
				this.doIfColumnIsNotPrimaryNorForeignKey(column);

			this.appendGettersSetters();
		}
		variables.append(NEW_LINE);

		if (this.daoDto.hasList()) {
			imports.append(this.buildImportLine(List.class)).append(this.buildImportLine(OneToMany.class))
					.append(this.buildImportLine(CascadeType.class)).append(this.buildImportLine(XmlTransient.class));
			variables.append(this.daoDto.getContentList());
			gettersSetters.append(this.daoDto.getContentListSetGet());
		}
		return new StringBuilder().append(this.daoDto.getPackageName()).append(imports)
				.append(this.addHeaderClassContent()).append(variables).append(gettersSetters)
				.append("}").toString();
	}

	private void addImports(Supplier<Stream<Column>> columnStream) {
		imports.append(this.buildImportLine(BaseActiveRecord.class))
				.append(this.buildImportLine(javax.persistence.Column.class)).append(this.buildImportLine(Entity.class))
				.append(this.buildImportLine(Id.class)).append(this.buildImportLine(NamedQuery.class))
				.append(this.buildImportLine(Table.class));

		if (!"view".equals(this.daoDto.getTableType())) {
			imports.append(this.buildImportLine(GenerationType.class))
					.append(this.buildImportLine(GeneratedValue.class));
		} else
			imports.append(this.buildImportLine(Immutable.class));

		if (this.daoDto.isJavaUtilDate()) {
			boolean hasDate = columnStream.get().map(column -> resolveColumnClass(column.getTypeSql()))
					.anyMatch(c -> c.equals(Date.class));
			if (hasDate)
				imports.append(this.buildImportLine(Temporal.class)).append(this.buildImportLine(TemporalType.class));
		}

		Predicate<Class<?>> predicate = c -> c.equals(Byte[].class) || c.equals(Integer.class) || c.equals(Float.class)
				|| c.equals(String.class) || c.equals(Double.class) || c.equals(Boolean.class);

		columnStream.get().map(column -> resolveColumnClass(column.getTypeSql())).distinct().filter(predicate.negate())
				.forEach(clazz -> imports.append(this.buildImportLine(clazz)));

		if (columnStream.get().anyMatch(Column::isForeignKey)) {
			imports.append(this.buildImportLine(ManyToOne.class)).append(this.buildImportLine(JoinColumn.class))
					.append(this.buildImportLine(ForeignKey.class));
		}
	}

	private void updateColumnsInfos(Column column) {
		this.columnType = column.isForeignKey() ? convertCase(column.getTableRelation(), true)
				: this.resolveColumnClass(column.getTypeSql()).getSimpleName();
		this.pascalCaseColumnName = convertCase(column.getName(), true);
		this.camelCaseColumnName = convertCase(column.getName(), false);
	}

	private void doIfColumnIsPrimaryKey(DatabaseMetadaHelper.Column column) throws SQLException {
		final String databaseType = this.decreptyDatabaseCode(this.daoDto.getConfigEnv().getType_db());
		final String sequence = this.getOracleSequence(databaseType);
		variables.append(TAB).append("@Id").append(NEW_LINE);

		if (databaseType.equals(DatabaseConfigHelper.ORACLE)) {
			imports.append("import javax.persistence.SequenceGenerator;").append(NEW_LINE);
			variables.append(TAB).append("@SequenceGenerator(name = \"").append(sequence)
					.append("Gen\", sequenceName = \"").append(sequence)
					.append("\", initialValue = 1, allocationSize = 1, schema = \"").append(this.daoDto.getSchema())
					.append("\")").append(NEW_LINE).append(TAB)
					.append("@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = \"").append(sequence)
					.append("Gen\")").append(NEW_LINE);
		} else
			variables.append(TAB).append("@GeneratedValue(strategy = GenerationType.IDENTITY)").append(NEW_LINE);

		variables.append(TAB).append("@Column(name = \"").append(column.getName())
				.append("\", updatable = false, nullable = false").append(")\n \tprivate ").append(columnType)
				.append(" ").append(camelCaseColumnName).append(";").append(NEW_LINE);
	}

	private void doIfColumnIsForeignKey(DatabaseMetadaHelper.Column column) {

		final Map<String, String> foreignKeysConstraintNamesMap = new DatabaseMetadaHelper()
				.getForeignKeysConstrainName(this.daoDto.getConfigEnv(), this.daoDto.getSchema(), daoDto.getTableName(),
						daoDto.getDadName());

		variables.append(TAB).append("@ManyToOne").append(NEW_LINE).append("\t@JoinColumn(name = \"")
				.append(column.getName()).append("\", foreignKey = @ForeignKey(name = \"")
				.append(foreignKeysConstraintNamesMap.get(column.getName())).append("\")")
				.append(this.addNullablePropertie(column.isNullable())).append(")").append(NEW_LINE).append(TAB)
				.append("private ").append(columnType).append(" ").append(camelCaseColumnName).append(";")
				.append(NEW_LINE);
	}

	private void doIfColumnIsNotPrimaryNorForeignKey(DatabaseMetadaHelper.Column column) {
		Class<?> clazz = this.resolveColumnClass(column.getTypeSql());
		if (columnType.equals(Byte[].class.getSimpleName())) {
			variables.append(TAB).append("@javax.persistence.Lob\r").append(NEW_LINE).append(TAB)
					.append("@org.hibernate.annotations.Type(type=\"org.hibernate.type.BinaryType\")").append(NEW_LINE);
		}
		if (clazz.equals(Date.class)) {
			variables.append("\t@Temporal(TemporalType." + this.getTemporalType(column.getTypeSql()) + ")\n");
		}
		variables.append(TAB).append("@Column(name = \"").append(column.getName()).append("\"")
				.append(this.addNullablePropertie(column.isNullable()))
				.append(this.addLenghtPropertie(clazz, column.getSize())).append(")").append(NEW_LINE).append(TAB)
				.append("private ").append(columnType).append(" ").append(camelCaseColumnName).append(";")
				.append(NEW_LINE);
	}

	private String getTemporalType(int typeSql) {
		if (typeSql == Types.TIMESTAMP || typeSql == Types.TIMESTAMP_WITH_TIMEZONE)
			return "TIMESTAMP";
		else if (typeSql == Types.TIME || typeSql == Types.TIME_WITH_TIMEZONE)
			return "TIME";
		return "DATE";
	}

	public static String convertCase(final String name, final boolean isFirstLetterLowerCase) {
		return CaseUtils.toCamelCase(name, isFirstLetterLowerCase, '_');
	}

	private Class<?> resolveColumnClass(int typeSql) {
		Class<?> clazz;
		switch (typeSql) {
		case Types.VARCHAR:
		case Types.NVARCHAR:
		case Types.CHAR:
		case Types.NCHAR:
		case Types.LONGVARCHAR:
		case Types.LONGNVARCHAR:
		case Types.STRUCT:
			clazz = String.class;
			break;
		case Types.SMALLINT:
		case Types.INTEGER:
		case Types.TINYINT:
		case Types.NUMERIC:
			clazz = Integer.class;
			break;
		case Types.BIGINT:
			clazz = BigInteger.class;
			break;
		case Types.DECIMAL:
			clazz = BigDecimal.class;
			break;
		case Types.REAL:
			clazz = Float.class;
			break;
		case Types.FLOAT:
		case Types.DOUBLE:
			clazz = Double.class;
			break;
		case Types.BIT:
		case Types.BOOLEAN:
			clazz = Boolean.class;
			break;
		case Types.TIME:
		case Types.TIME_WITH_TIMEZONE:
			clazz = this.daoDto.isJavaUtilDate() ? Date.class : LocalTime.class;
			break;
		case Types.TIMESTAMP:
		case Types.TIMESTAMP_WITH_TIMEZONE:
			clazz = this.daoDto.isJavaUtilDate() ? Date.class : LocalDateTime.class;
			break;
		case Types.DATE:
			clazz = this.daoDto.isJavaUtilDate() ? Date.class : LocalDate.class;
			break;
		case Types.BINARY:
		case Types.VARBINARY:
		case Types.LONGVARBINARY:
		case Types.BLOB:
		case Types.CLOB:
			clazz = Byte[].class;
			break;
		case Types.OTHER:
			clazz = UUID.class;
			break;
		default:
			clazz = Object.class;
		}
		return clazz;
	}

	private String buildImportLine(Class<?> clazz) {
		return "import " + clazz.getCanonicalName() + ";" + NEW_LINE;
	}

	private String addHeaderClassContent() {
		return new StringBuilder().append(NEW_LINE).append("/**").append(NEW_LINE).append(" * @author: ")
				.append(Core.getCurrentUser().getName()).append(" ").append(Core.getCurrentDate()).append(NEW_LINE)
				.append("*/").append(NEW_LINE).append(NEW_LINE).append("@Entity").append(NEW_LINE)
				.append(this.daoDto.getTableType().equals("view") ? "@Immutable".concat(NEW_LINE) : "")
				.append("@Table(name = \"").append(this.daoDto.getTableName()).append("\", schema = \"")
				.append(this.daoDto.getSchema()).append("\")").append(NEW_LINE).append("@NamedQuery(name = \"")
				.append(this.daoDto.getDaoClassName())
				.append(".findAll\", query = \"SELECT t FROM ")
				.append(this.daoDto.getDaoClassName()).append(" ").append("t").append("\")").append(NEW_LINE)
				.append("public class ").append(this.daoDto.getDaoClassName()).append(" extends BaseActiveRecord<")
				.append(this.daoDto.getDaoClassName()).append("> {").append(NEW_LINE).append(NEW_LINE).append(TAB)
				.append("private static final long serialVersionUID = 1L;").append(NEW_LINE).append(NEW_LINE)
				.append(this.daoDto.getTableType().equals("view") ? TAB + "// Consider adding identifier/primary Key(@Id) annotation for your views!" + NEW_LINE + NEW_LINE: "")
				.append(TAB).append("// Change Integer type to BigDecimal if the number is very large!").append(NEW_LINE)
				.append(NEW_LINE).toString();
	}

	private String addNullablePropertie(boolean isNullable) {
		return isNullable ? "" : ", nullable = false";
	}

	private String addLenghtPropertie(Class<?> clazz, Integer size) {
		return clazz.equals(String.class) ? ", length = " + size : "";
	}

	private void appendGettersSetters() {
		gettersSetters.append(new StringBuilder().append(TAB).append("public ").append(this.columnType).append(" get")
				.append(this.pascalCaseColumnName).append("() { \n\t\treturn this.").append(this.camelCaseColumnName)
				.append(";").append(NEW_LINE).append(TAB).append("}").append(NEW_LINE).append(NEW_LINE).toString());
		if (!"view".equals(daoDto.getTableType())) {
			gettersSetters.append(new StringBuilder().append(TAB).append("public void set")
					.append(this.pascalCaseColumnName).append("(").append(this.columnType).append(" ")
					.append(this.camelCaseColumnName).append(") {").append(NEW_LINE).append(TAB).append(TAB)
					.append(" this.").append(this.camelCaseColumnName).append(" = ").append(this.camelCaseColumnName)
					.append(";").append(NEW_LINE).append(TAB).append("}").append(NEW_LINE).append(NEW_LINE).toString());
		}
	}

	private String decreptyDatabaseCode(String type) {
		return Core.decrypt(type, EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
	}

	private String getOracleSequence(String databaseType) throws SQLException {
		String sequence = " ";
		if (databaseType.equalsIgnoreCase(DatabaseConfigHelper.ORACLE)) {
			PreparedStatement preparedStatement = null;
			java.sql.Connection connection = null;
			try {

				final String sql = "select seqs.sequence_name seq from all_tables tabs "
						+ "join all_triggers trigs on trigs.table_owner = tabs.owner "
						+ "and trigs.table_name = tabs.table_name join all_dependencies deps "
						+ "on deps.owner = trigs.owner and deps.name = trigs.trigger_name "
						+ "join all_sequences seqs on seqs.sequence_owner = deps.referenced_owner "
						+ "and seqs.sequence_name = deps.referenced_name where tabs.table_name='"
						+ this.daoDto.getTableName() + "'";

				connection = Connection.getConnection(this.daoDto.getConfigEnv());
				preparedStatement = connection.prepareStatement(sql);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					sequence = resultSet.getString("seq");
				}
			} catch (Exception e) {
				e.printStackTrace();
				Core.setMessageError("Oracle Sequence error");
			} finally {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			}
		}
		return sequence;
	}

	private String generateVariableTypeList(String referencedDaoClass, String referencedColumnClass) {
		return new StringBuilder().append(TAB).append("@OneToMany(cascade = CascadeType.ALL, mappedBy = \"")
				.append(referencedColumnClass).append("\")").append(NEW_LINE).append(TAB).append("private List<")
				.append(referencedDaoClass).append("> ").append(convertCase(referencedDaoClass, false)).append("List;")
				.append(NEW_LINE).append(NEW_LINE).toString();
	}

	private String generateVariableTypeListGetterSetter(String referencedDaoClass) {
		String lowerCamelCaseClassName = convertCase(referencedDaoClass, false);
		return new StringBuilder().append(TAB).append("@XmlTransient").append(NEW_LINE).append(TAB)
				.append("public List<").append(referencedDaoClass).append("> get").append(lowerCamelCaseClassName)
				.append("List() {").append(NEW_LINE).append(TAB).append(TAB).append("return ")
				.append(lowerCamelCaseClassName).append("List;").append(NEW_LINE).append(TAB).append("}")
				.append(NEW_LINE).append(TAB).append("public void set").append(lowerCamelCaseClassName)
				.append("List(List<").append(referencedDaoClass).append("> ").append(lowerCamelCaseClassName)
				.append("List) {").append(NEW_LINE).append(TAB).append(TAB).append("this.")
				.append(lowerCamelCaseClassName).append("List = ").append(lowerCamelCaseClassName).append("List;")
				.append(NEW_LINE).append(TAB).append("}").append(NEW_LINE).append(NEW_LINE).toString();
	}
}
