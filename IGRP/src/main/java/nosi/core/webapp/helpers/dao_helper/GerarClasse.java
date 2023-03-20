package nosi.core.webapp.helpers.dao_helper;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.function.Function;
import java.util.stream.Collectors;

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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

import org.apache.commons.text.CaseUtils;
import org.hibernate.annotations.GenericGenerator;
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
	private StringBuilder variables;
	private StringBuilder gettersSetters;
	private StringBuilder fieldsStatic;
	private String columnType;
	private String pascalCaseColumnName;
	private String camelCaseColumnName;
	private static final String NEW_LINE = "\n";
	private static final String TAB = "\t";
	private Set<Class<?>> importClasses = new HashSet<>();

	public GerarClasse(DaoDto daoDto) {
		this.daoDto = daoDto;
		this.variables = new StringBuilder();
		this.gettersSetters = new StringBuilder();
		this.fieldsStatic = new StringBuilder("public static final class Field {");
		this.addDefaultImports();
	}

	private Function<Class<?>, String> buildImportLine = clazz -> "import " + clazz.getCanonicalName() + ";" + NEW_LINE;

	public String generate() throws SQLException, IOException {

		List<Column> columns = DatabaseMetadaHelper.getCollumns(this.daoDto.getConfigEnv(), this.daoDto.getSchema(),
				this.daoDto.getTableName());

		for (DatabaseMetadaHelper.Column column : columns) {

			this.updateColumnsInfos(column);

			if (column.isPrimaryKey())
				this.doIfColumnIsPrimaryKey(column);

			else if (column.isForeignKey()) {

				this.doIfColumnIsForeignKey(column);

				if (!Core.fileExists(new Config().getPathDAO(this.daoDto.getDadName()) + columnType
						+ CRUDGeneratorController.JAVA_EXTENSION)) {
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
					newDaoDto.setDaoClassName(columnType);
					new CRUDGeneratorController().generateDAO(newDaoDto);
				}

			} else
				this.doIfColumnIsNotPrimaryNorForeignKey(column);

			this.appendGettersSetters();
			
			this.appendFieldsStatic(column.getName());
		}
		variables.append(NEW_LINE);

		if (this.daoDto.hasList()) {

			this.importClasses.add(List.class);
			this.importClasses.add(OneToMany.class);
			this.importClasses.add(CascadeType.class);
			this.importClasses.add(XmlTransient.class);

			variables.append(this.daoDto.getContentList());
			gettersSetters.append(this.daoDto.getContentListSetGet());
		}

		final String imports = this.importClasses.stream().map(buildImportLine).collect(Collectors.joining(""));
		
		fieldsStatic.append(NEW_LINE).append(NEW_LINE).append(TAB).append("private Field() {}");
				fieldsStatic.append(NEW_LINE).append(TAB)
				.append("}");
		
		return new StringBuilder()
				.append(this.daoDto.getPackageName())
				.append(imports)
				.append(this.addHeaderClassContent())
				.append(variables)
				.append(gettersSetters)
				.append(fieldsStatic)
				.append(NEW_LINE)
				.append("}").toString();
	}

	private void addDefaultImports() {
		this.importClasses.add(BaseActiveRecord.class);
		this.importClasses.add(javax.persistence.Column.class);
		this.importClasses.add(Id.class);
		this.importClasses.add(NamedQuery.class);
		this.importClasses.add(Table.class);
		this.importClasses.add(Entity.class);
		this.importClasses.add(this.isView() ? Immutable.class : GeneratedValue.class);
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

			this.importClasses.add(GenerationType.class);
			this.importClasses.add(SequenceGenerator.class);

			variables.append(TAB).append("@SequenceGenerator(name = \"").append(sequence)
					.append("Gen\", sequenceName = \"").append(sequence)
					.append("\", allocationSize = 1, schema = \"").append(this.daoDto.getSchema())
					.append("\")").append(NEW_LINE).append(TAB)
					.append("@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = \"").append(sequence)
					.append("Gen\")").append(NEW_LINE);

		} else if (columnType.equals(UUID.class.getSimpleName())) {
			this.importClasses.add(GenericGenerator.class);

			variables.append(TAB).append("@GeneratedValue(generator = \"UUID\")").append(NEW_LINE).append(TAB)
					.append("@GenericGenerator(name = \"UUID\", strategy = \"org.hibernate.id.UUIDGenerator\")")
					.append(NEW_LINE);
		} else {
			this.importClasses.add(GenerationType.class);
			variables.append(TAB).append("@GeneratedValue(strategy = GenerationType.IDENTITY)").append(NEW_LINE);
		}

		variables.append(TAB).append("@Column(name = \"").append(column.getName())
				.append("\", nullable = false, updatable = false").append(")\n \tprivate ").append(columnType)
				.append(" ").append(camelCaseColumnName).append(";").append(NEW_LINE);
	}

	private void doIfColumnIsForeignKey(DatabaseMetadaHelper.Column column) {
		Class<?> clazz = this.resolveColumnClass(column.getTypeSql());
		this.importClasses.add(ManyToOne.class);
		this.importClasses.add(JoinColumn.class);
		this.importClasses.add(ForeignKey.class);

		Map<String, String> foreignKeysConstraintNamesMap = new DatabaseMetadaHelper().getForeignKeysConstrainName(
				this.daoDto.getConfigEnv(), this.daoDto.getSchema(), daoDto.getTableName(), daoDto.getDadName());

		String foreignKeyName = foreignKeysConstraintNamesMap.get(column.getName());
		String referencedColumnName=foreignKeysConstraintNamesMap.get(foreignKeyName);
		variables.append(this.addNullablePropertie(clazz, column.isNullable()))
				.append(this.addStringProperties(clazz, column.getSize(), column.isNullable()))
				.append(TAB).append("@ManyToOne")
				.append(NEW_LINE).append("\t@JoinColumn(name = \"")
				.append(column.getName()).append("\", foreignKey = @ForeignKey(name = \"").append(foreignKeyName).append("\")")
				.append(referencedColumnName.equals("id")?"":", referencedColumnName=\""+referencedColumnName+"\"").append(")")
				.append(NEW_LINE).append(TAB).append("private ").append(columnType).append(" ").append(camelCaseColumnName).append(";")
				.append(NEW_LINE);
	}

	private void doIfColumnIsNotPrimaryNorForeignKey(DatabaseMetadaHelper.Column column) {
		Class<?> clazz = this.resolveColumnClass(column.getTypeSql());
		if (columnType.equals(Byte[].class.getSimpleName())) {
			variables.append(TAB).append("@javax.persistence.Lob\r").append(NEW_LINE).append(TAB)
					.append("@org.hibernate.annotations.Type(type=\"org.hibernate.type.BinaryType\")").append(NEW_LINE);
		}
				
		variables.append(this.addNullablePropertie(clazz, column.isNullable()))
			.append(this.addStringProperties(clazz, column.getSize(), column.isNullable())).append(TAB)
			.append("@Column(name = \"").append(column.getName()).append("\"");
		if(columnType.equals(Object.class.getSimpleName()) || (columnType.equals(String.class.getSimpleName()) && !column.getColumnTypeName​().equalsIgnoreCase("varchar")))
			variables.append(", columnDefinition = \"").append(column.getColumnTypeName​()).append("\"");
		variables.append(")").append(NEW_LINE)
			.append(TAB).append("private ").append(columnType).append(" ").append(camelCaseColumnName).append(";")
			.append(NEW_LINE);			
	}

	private String addNullablePropertie(Class<?> clazz, boolean isNullable) {
		if (clazz.equals(String.class) || isNullable || this.isView())
			return "";
		else {
			this.importClasses.add(NotNull.class);
			return TAB + "@NotNull" + NEW_LINE;
		}
	}

	private String addStringProperties(Class<?> clazz, Integer size, boolean isNullable) {

		if (!clazz.equals(String.class) || this.isView())
			return "";

		final StringBuilder annotationsProps = new StringBuilder();
		final boolean isDefaultMaxSize = size == Integer.MAX_VALUE;	

		//Não pode ser Null -  NotNull
		if (!isNullable) {				
			this.importClasses.add(NotBlank.class);
			annotationsProps.append(TAB).append("@NotBlank").append(NEW_LINE);	
		}		
		if(!isDefaultMaxSize) {
			this.importClasses.add(Size.class);
			annotationsProps.append(TAB).append("@Size(").append("max = ").append(size).append(")")
					.append(NEW_LINE);
		}
		return annotationsProps.toString();
	}

	private boolean isView() {
		return "view".equals(this.daoDto.getTableType());
	}

	public static String convertCase(String name, boolean firstLetterLowerCase) {
		return CaseUtils.toCamelCase(name, firstLetterLowerCase, '_');
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
		case Types.TINYINT:
			clazz = Short.class;
			break;
		case Types.INTEGER:
			clazz = Integer.class;
			break;
		case Types.BIGINT:
			clazz = Long.class;
			break;
		case Types.DECIMAL:
		case Types.NUMERIC:	
			clazz = BigDecimal.class;
			this.importClasses.add(BigDecimal.class);
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
			clazz = LocalTime.class;
			this.importClasses.add(LocalTime.class);
			break;
		case Types.TIMESTAMP:
		case Types.TIMESTAMP_WITH_TIMEZONE:
			clazz = LocalDateTime.class;
			this.importClasses.add(LocalDateTime.class);
			break;
		case Types.DATE:
			clazz = LocalDate.class;
			this.importClasses.add(LocalDate.class);
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
			this.importClasses.add(UUID.class);
			break;
		default:
			clazz = Object.class;
		}
		return clazz;
	}

	private String addHeaderClassContent() {
		return new StringBuilder().append(NEW_LINE)
				.append("/**").append(NEW_LINE)
				.append(" * @author: ").append(Core.getCurrentUser().getName()).append(" ").append(Core.getCurrentDate()).append(NEW_LINE)
				.append("*/").append(NEW_LINE)
				.append("//@XmlRootElement // Can be used for REST / XML API").append(NEW_LINE)
				.append(NEW_LINE)
				.append("@Entity").append(NEW_LINE)
				.append(this.isView() ? "@Immutable".concat(NEW_LINE) : "").append("@Table(name = \"")
				.append(this.daoDto.getTableName()).append("\", schema = \"").append(this.daoDto.getSchema())
				.append("\")").append(NEW_LINE).append("@NamedQuery(name = \"").append(this.daoDto.getDaoClassName())
				.append(".findAll\", query = \"SELECT t FROM ").append(this.daoDto.getDaoClassName()).append(" ")
				.append("t").append("\")").append(NEW_LINE).append("public class ")
				.append(this.daoDto.getDaoClassName()).append(" extends BaseActiveRecord<")
				.append(this.daoDto.getDaoClassName()).append("> {").append(NEW_LINE)
				.append(NEW_LINE)
				.append(TAB).append("private static final long serialVersionUID = 1L;").append(NEW_LINE)
				.append(NEW_LINE)
				.append(TAB).append("public static final String TABLE_NAME = \""+this.daoDto.getTableName().toUpperCase()+"\";").append(NEW_LINE)
				.append(NEW_LINE)
				.append(this.isView()
						? TAB + "// Consider adding identifier/primary Key(@Id) annotation for your views!" + NEW_LINE+ NEW_LINE: "")
				.append(TAB).append("// Change Integer type to BigDecimal if the number is very large!")
				.append(NEW_LINE).append(NEW_LINE).toString();
	}

	private void appendGettersSetters() {
		gettersSetters.append(new StringBuilder().append(TAB).append("public ").append(this.columnType).append(" get")
				.append(this.pascalCaseColumnName).append("() { \n\t\treturn this.").append(this.camelCaseColumnName)
				.append(";").append(NEW_LINE).append(TAB).append("}").append(NEW_LINE).append(NEW_LINE).toString());
		if (!this.isView()) {
			gettersSetters.append(new StringBuilder().append(TAB).append("public void set")
					.append(this.pascalCaseColumnName).append("(").append(this.columnType).append(" ")
					.append(this.camelCaseColumnName).append(") {").append(NEW_LINE).append(TAB).append(TAB)
					.append(" this.").append(this.camelCaseColumnName).append(" = ").append(this.camelCaseColumnName)
					.append(";").append(NEW_LINE).append(TAB).append("}").append(NEW_LINE).append(NEW_LINE).toString());
		}
	}
	
	private void appendFieldsStatic(String columnName) {
		fieldsStatic.append(NEW_LINE).append(new StringBuilder().append(TAB).append("public static final String ")
				.append(columnName.toUpperCase()).append(" = ").append("\""+this.camelCaseColumnName+"\"")
				.append(";").toString());
		
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
