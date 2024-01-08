package nosi.core.webapp.helpers.dao_helper;

import java.io.IOException;
import java.io.Serial;
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
import java.util.Objects;
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

import org.apache.commons.text.CaseUtils;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Immutable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlTransient;
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
	private final DaoDto daoDto;
	private final StringBuilder variables;
	private final StringBuilder gettersSetters;
	private final StringBuilder fieldsStatic;
	private String columnType;
	private String pascalCaseColumnName;
	private String camelCaseColumnName;
	private static final String NEW_LINE = "\n";
	private static final String TAB = "\t";
	private final Set<Class<?>> importClasses = new HashSet<>();

   public GerarClasse(DaoDto daoDto) {
		this.daoDto = daoDto;
		this.variables = new StringBuilder();
		this.gettersSetters = new StringBuilder();
		this.fieldsStatic = new StringBuilder("   public static final class Field {"+ NEW_LINE);
		this.addDefaultImports();
	}

	private final Function<Class<?>, String> buildImportLine = clazz -> "import " + clazz.getCanonicalName() + ";" + NEW_LINE;

	public String generate() throws SQLException, IOException {

		final var columns = DatabaseMetadaHelper.getCollumns(this.daoDto.getConfigEnv(), this.daoDto.getSchema(), this.daoDto.getTableName());

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

					var newDaoDto = new DaoDto();
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

		final String imports = this.importClasses.stream().map(buildImportLine).collect(Collectors.joining());

		fieldsStatic.append(NEW_LINE).append(TAB).append("  private Field() {}").append(NEW_LINE).append(TAB).append("}");

		return this.daoDto.getPackageName() +
			   imports +
			   this.addHeaderClassContent() +
			   variables +
			   gettersSetters +
			   fieldsStatic +
			   NEW_LINE +
			   "}";
	}

	private void addDefaultImports() {
		this.importClasses.add(BaseActiveRecord.class);
		this.importClasses.add(javax.persistence.Column.class);
		this.importClasses.add(Id.class);
		this.importClasses.add(NamedQuery.class);
		this.importClasses.add(Table.class);
		this.importClasses.add(Entity.class);
		this.importClasses.add(Serial.class);
		this.importClasses.add(this.isView() ? Immutable.class : GeneratedValue.class);
	}

	private void updateColumnsInfos(Column column) {
		this.columnType = column.isForeignKey() ? convertCase(column.getTableRelation(), true)
				: this.resolveColumnClass(column.getTypeSql()).getSimpleName();
		this.pascalCaseColumnName = convertCase(column.getName(), true);
		this.camelCaseColumnName = convertCase(column.getName(), false);
	}
	private void doIfColumnIsPrimaryKey(DatabaseMetadaHelper.Column column) throws SQLException {

		final var dbType = this.decryptDatabaseCode(this.daoDto.getConfigEnv().getType_db());

		final var sequence = this.getOracleSequence(dbType);
		variables.append(TAB).append("@Id").append(NEW_LINE);

		if (dbType.equals(DatabaseConfigHelper.ORACLE)) {

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

		final var clazz = this.resolveColumnClass(column.getTypeSql());
		this.importClasses.add(ManyToOne.class);
		this.importClasses.add(JoinColumn.class);
		this.importClasses.add(ForeignKey.class);

		final var foreignKeysConstraintNamesMap = new DatabaseMetadaHelper().getForeignKeysConstrainName(
				this.daoDto.getConfigEnv(), this.daoDto.getSchema(), daoDto.getTableName(), daoDto.getDadName());

		final var foreignKeyName = foreignKeysConstraintNamesMap.get(column.getName());
		final var referencedColumnName=foreignKeysConstraintNamesMap.get(foreignKeyName);
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
		final var clazz = this.resolveColumnClass(column.getTypeSql());
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

      this.importClasses.add(NotNull.class);
      return TAB + "@NotNull" + NEW_LINE;
   }

	private String addStringProperties(Class<?> clazz, Integer size, boolean isNullable) {

//		IMPORTANT: Integer, Double. etc cannot be used with NotBlank and @Size
		if (!clazz.equals(String.class) || this.isView())
			return "";

		final StringBuilder annotationsProps = new StringBuilder();

		//Não pode ser Null -  NotNull
		if (!isNullable) {
			this.importClasses.add(NotBlank.class);
			annotationsProps.append(TAB).append("@NotBlank").append(NEW_LINE);
		}

       final boolean isDefaultMaxSize = size >= Short.MAX_VALUE;
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
      return switch (typeSql) {
         case Types.VARCHAR, Types.NVARCHAR, Types.CHAR, Types.NCHAR,
                 Types.LONGVARCHAR, Types.LONGNVARCHAR, Types.STRUCT -> String.class;
         case Types.SMALLINT, Types.TINYINT -> Short.class;
         case Types.INTEGER -> Integer.class;
         case Types.BIGINT -> Long.class;
         case Types.NUMERIC, Types.DECIMAL -> {
            this.importClasses.add(BigDecimal.class);
            yield BigDecimal.class;
         }
         case Types.REAL -> Float.class;
         case Types.FLOAT, Types.DOUBLE -> Double.class;
         case Types.BIT, Types.BOOLEAN -> Boolean.class;
         case Types.TIME, Types.TIME_WITH_TIMEZONE -> {
            this.importClasses.add(LocalTime.class);
            yield LocalTime.class;
         }
         case Types.TIMESTAMP, Types.TIMESTAMP_WITH_TIMEZONE -> {
            this.importClasses.add(LocalDateTime.class);
            yield LocalDateTime.class;
         }
         case Types.DATE -> {
            this.importClasses.add(LocalDate.class);
            yield LocalDate.class;
         }
         case Types.BINARY, Types.VARBINARY, Types.LONGVARBINARY, Types.BLOB, Types.CLOB -> Byte[].class;
         case Types.OTHER -> {
            this.importClasses.add(UUID.class);
            yield UUID.class;
         }
         default -> Object.class;
      };
   }

	private String addHeaderClassContent() {
		return """
            
            /**
             * @author: %s %s
             */
            
            //@XmlRootElement // Can be used for REST / XML API
            
            %s
            @Table(name = "%s", schema = "%s")
            @NamedQuery(name = "%s.findAll", query = "SELECT t FROM %s t")
            public class %s extends BaseActiveRecord<%s> {
            
                @Serial
                private static final long serialVersionUID = 1L;
            
                public static final String TABLE_NAME = "%s";
            
                %s
            
            """.formatted(
				Objects.requireNonNull(Core.getCurrentUser()).getName(),
				LocalDate.now().toString(),
				this.isView() ? """
						@Entity
						@Immutable
						""" : "@Entity",
				this.daoDto.getTableName(),
				this.daoDto.getSchema(),
				this.daoDto.getDaoClassName(),
				this.daoDto.getDaoClassName(),
				this.daoDto.getDaoClassName(),
				this.daoDto.getDaoClassName(),
				this.daoDto.getTableName().toUpperCase(),
				(this.isView() ? """
						// Consider adding identifier/primary Key(@Id) annotation for your views
						    // Change Integer type to BigDecimal if the number is very large
						"""
						: "// Change Integer type to BigDecimal if the number is very large")
		);
	}

	private static final String FIELD_TEMPLATE_FOR_FIELDS_CLASS = """
			      public static final String %s = "%s";
			""";

	private void appendFieldsStatic(String columnName) {
		fieldsStatic.append(
				FIELD_TEMPLATE_FOR_FIELDS_CLASS.formatted(
						columnName.toUpperCase(),
						this.camelCaseColumnName
				));
	}

	private String decryptDatabaseCode(String type) {
		return Core.decrypt(type, EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
	}

	private String getOracleSequence(String databaseType) throws SQLException {

		var sequence = " ";

		if (!databaseType.equalsIgnoreCase(DatabaseConfigHelper.ORACLE))
			return sequence;

		PreparedStatement preparedStatement = null;
		java.sql.Connection connection = null;

		try {

			final var sql = """
					select seqs.sequence_name seq
					from all_tables tabs
					     join all_triggers trigs on trigs.table_owner = tabs.owner and trigs.table_name = tabs.table_name
					     join all_dependencies deps on deps.owner = trigs.owner and deps.name = trigs.trigger_name
					     join all_sequences seqs on seqs.sequence_owner = deps.referenced_owner and seqs.sequence_name = deps.referenced_name
					where tabs.table_name = '%s'
					""";

			connection = Connection.getConnection(this.daoDto.getConfigEnv());
			preparedStatement = connection.prepareStatement(sql.formatted(this.daoDto.getTableName()));
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

		return sequence;
	}

	private String generateVariableTypeList(String referencedDaoClass, String referencedColumnClass) {
		return TAB + "@OneToMany(cascade = CascadeType.ALL, mappedBy = \"" +
			   referencedColumnClass + "\")" + NEW_LINE + TAB + "private List<" +
			   referencedDaoClass + "> " + convertCase(referencedDaoClass, false) + "List;" +
			   NEW_LINE + NEW_LINE;
	}

	private String generateVariableTypeListGetterSetter(String referencedDaoClass) {
		final String lowerCamelCaseClassName = convertCase(referencedDaoClass, false);
		return TAB + "@XmlTransient" + NEW_LINE + TAB +
			   "public List<" + referencedDaoClass + "> get" + lowerCamelCaseClassName +
			   "List() {" + NEW_LINE + TAB + TAB + "return " +
			   lowerCamelCaseClassName + "List;" + NEW_LINE + TAB + "}" +
			   NEW_LINE + TAB + "public void set" + lowerCamelCaseClassName +
			   "List(List<" + referencedDaoClass + "> " + lowerCamelCaseClassName +
			   "List) {" + NEW_LINE + TAB + TAB + "this." +
			   lowerCamelCaseClassName + "List = " + lowerCamelCaseClassName + "List;" +
			   NEW_LINE + TAB + "}" + NEW_LINE + NEW_LINE;
	}

	private static final String GETTER_METHOD_TEMPLATE = """
			   public %s get%s() {
			      return this.%s;
			   }
			   
			""";

	private static final String SETTER_METHOD_TEMPLATE = """
			   public void set%s(%s %s) {
			      this.%s = %s;
			   }
			  
			""";

	private void appendGettersSetters() {
		gettersSetters.append(
				GETTER_METHOD_TEMPLATE.formatted(
						this.columnType,
						this.pascalCaseColumnName,
						this.camelCaseColumnName
				));

		if (!this.isView()) {
			gettersSetters.append(
					SETTER_METHOD_TEMPLATE.formatted(
							this.pascalCaseColumnName,
							this.columnType,
							this.camelCaseColumnName,
							this.camelCaseColumnName,
							this.camelCaseColumnName
					));
		}
	}
}
