package cv.nosi.core.webapp.util.helpers.dao;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cv.nosi.core.config.Config;
import cv.nosi.core.webapp.security.EncrypDecrypt;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.Connection;
import cv.nosi.core.webapp.util.helpers.database.DatabaseConfigHelper;
import cv.nosi.core.webapp.util.helpers.database.DatabaseMetadaHelper;
import cv.nosi.webapps.igrp.dao.Config_env;
import cv.nosi.webapps.igrp_studio.pages.crudgenerator.CRUDGeneratorController;

/**
 * Isaias.Nunes
 * Aug 22, 2019
 */
public class GerarClasse {
	public String gerarCode(String dad_name,String tbl_name, String clas_dao_name,List<DatabaseMetadaHelper.Column> columns, String schema,Config_env config, boolean tem_list, String conten_list, String conten_list_set_get) throws IOException {
		
		//definição das variaveis
		String content_import="";
		String content_package="";
		String content="";
		int cont = 0;
		boolean isBigint=true,isBigDec=true;
		int cont_import = 0;
		String tipo_db = this.decreptyCode(config.getType_db());
		String seq="";
		
		if(tipo_db.equalsIgnoreCase(DatabaseConfigHelper.ORACLE)) {
			seq = this.getSequenceOracle(tbl_name, config);
		}
		//package
		content_package = "package nosi.webapps."+dad_name+".dao;\n\n";
		
		//import
		content_import = content_import +"import nosi.base.ActiveRecord.BaseActiveRecord;\n" +
							"import java.io.Serializable;\n" +
							"import javax.persistence.Column;\n" +
							"import javax.persistence.Entity;\n" +
						    "import javax.persistence.Id;\n" +
						    "import javax.persistence.GenerationType;\n" +
						    "import javax.persistence.GeneratedValue;\n" + 
						    "import javax.persistence.NamedQuery;\n"+
						    "import javax.persistence.Table;\n\n";
		
		//autor
		content = content +"/**\n" + 
		" * @author: " +Core.getCurrentUser().getName()+"\n" + 
		" * "+ Core.getCurrentDateSql()+"\n" + 
		"*/\n\n";

		content = content + "@Entity\n" + 
		"@Table(name=\""+ tbl_name +"\",schema=\""+schema+"\")\n";		
		content = content + "@NamedQuery(name=\""+clas_dao_name+".findAll\", query=\"SELECT b FROM "+clas_dao_name+" b\")\n";
		content = content + "public class "+ clas_dao_name + " extends BaseActiveRecord<" + clas_dao_name + "> implements Serializable{\n\n";
		content = content + "\tprivate static final long serialVersionUID = 1L;\n\n";
		
		String content_variaveis = "";
		for(DatabaseMetadaHelper.Column cl : columns) {
			if(isBigint && this.resolveType(cl).equalsIgnoreCase("BigInteger")) {
					content_import = content_import + "import java.math.BigInteger;\n";
					isBigint=false;
				
			}else if(isBigDec && this.resolveType(cl).equalsIgnoreCase("BigDecimal")) {					
					content_import = content_import + "import java.math.BigDecimal;\n";
					isBigDec=false;					
			}
			if(cl.isPrimaryKey()) {
				content_variaveis = content_variaveis + "\t@Id\n";
				if(tipo_db.equalsIgnoreCase(DatabaseConfigHelper.ORACLE)) {
					content_import = content_import + "import javax.persistence.SequenceGenerator;\n";
					content_variaveis = content_variaveis +   "\t@SequenceGenerator(name = \""+seq+"Gen\",sequenceName =\""+seq+"\", initialValue = 1, allocationSize = 1, schema=\""+schema+"\")\n";
					content_variaveis = content_variaveis + "\t@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = \""+seq+"Gen\")\n";
				}else {
					content_variaveis = content_variaveis +  "\t@GeneratedValue(strategy=GenerationType.IDENTITY)\n";
				}
						
				content_variaveis = content_variaveis +   "\t@Column(name=\""+cl.getName()+"\", nullable="+( cl.isNullable() ? "true" : "false") +")\n"
						 + "\tprivate "+ this.resolveType(cl) +" " +this.resolveName1Dw(cl.getName())+";\n";
				
				
				
			}else if(cl.isForeignKey()) {
				cont_import +=1;
				Map<String, String> fk_constrain_name = new DatabaseMetadaHelper().getForeignKeysConstrainName(config, schema, tbl_name,dad_name);
				String tabela_relacional = cl.getTableRelation();
				content_variaveis = content_variaveis + "\t@ManyToOne\n"
						+ "\t@JoinColumn(name=\""+ cl.getName() +"\", foreignKey=@ForeignKey(name=\""+ fk_constrain_name.get(cl.getName())+"\"), nullable="+( cl.isNullable() ? "true" : "false") +")\n"+
						"\tprivate "+ this.resolveName1Up(tabela_relacional) +" " +this.resolveName1Dw(cl.getName())+";\n";
				if(cont_import == 1) {
					content_import = content_import +"import javax.persistence.ManyToOne;\n" +
							"import javax.persistence.JoinColumn;\n" +
							"import javax.persistence.ForeignKey;\n\n";
				}
				
				//vereficar se a classe com dependencia existe
				if(!Core.fileExists(new Config().getPathDAO(dad_name) + this.resolveDAOName(tabela_relacional+".java"))) {
					conten_list = this.GerarList(clas_dao_name, this.resolveName1Dw(cl.getName()));
					conten_list_set_get = this.GerarListSetGet(clas_dao_name, this.resolveName1Dw(cl.getName()));
					new CRUDGeneratorController().generateDAO(config, schema, tabela_relacional, dad_name,true, conten_list, conten_list_set_get);
				}
				
			}else {
				if(this.resolveType(cl).equalsIgnoreCase("Date")) {
					cont +=1;
					String temporalType="DATE";
					if(cont == 1) {
						content_import = content_import + "import java.util.Date;\nimport javax.persistence.Temporal;\r\n" + 
								"import javax.persistence.TemporalType;\n";
					}
					if(cl.getTypeSql()==Types.TIMESTAMP || cl.getTypeSql()==Types.TIMESTAMP_WITH_TIMEZONE)
						temporalType="TIMESTAMP";
					else if(cl.getTypeSql()==Types.TIME || cl.getTypeSql()==Types.TIME_WITH_TIMEZONE)
						temporalType="TIME";
					content_variaveis = content_variaveis + "\t@Temporal(TemporalType."+temporalType+")\n";
				}else if(this.resolveType(cl).equalsIgnoreCase("byte[]")) {
					content_variaveis = content_variaveis + "\t@javax.persistence.Lob\r\n" +
							"\t@org.hibernate.annotations.Type(type=\"org.hibernate.type.BinaryType\")\n";
					
				}
			
				content_variaveis = content_variaveis +  "\t@Column(name=\""+cl.getName()+"\",nullable="+( cl.isNullable() ? "true" : "false") +( cl.getSize() == 2147483647 ? "" : ",length="+cl.getSize() ) +")\n"+
						"\tprivate "+ this.resolveType(cl) +" " +this.resolveName1Dw(cl.getName())+";\n";
				
			}
			
			}
		if(tem_list) {
			content_import = content_import + "import javax.persistence.CascadeType;\n" + 
											  "import javax.persistence.OneToMany;\n" + 
											  "import java.util.List;\n" +
											  "import javax.xml.bind.annotation.XmlTransient;\n\n";
			content_variaveis = content_variaveis + conten_list;
			
		}
		
		content_variaveis = content_variaveis +"\n";
		
		String content_setAndGet = "";
		for(DatabaseMetadaHelper.Column cl : columns) {
			if(!cl.isForeignKey()) {
				  content_setAndGet = content_setAndGet + (cl.getTypeSql()==Types.NUMERIC?"\t//Change Integer to BigDecimal if the number is very large!\n":"")+
						"\tpublic " + this.resolveType(cl) + " get"+this.resolveName1Up(cl.getName())+"() {\n" + 
						"\t\treturn "+this.resolveName1Dw(cl.getName())+";\n" + 
						"\t}\n" + 
						"\tpublic void set"+this.resolveName1Up(cl.getName())+"("+ this.resolveType(cl) +" "+this.resolveName1Dw(cl.getName())+") {\n" + 
						"\t\tthis."+this.resolveName1Dw(cl.getName())+" = "+this.resolveName1Dw(cl.getName())+";\n" + 
						"\t}\n";
			}else {
				//Map<String, String> fk_table_name = new DatabaseMetadaHelper().getForeignKeys(config, schema, tbl_name,dad_name);
				String tabela_relacional = cl.getTableRelation();
				content_setAndGet = content_setAndGet + "\tpublic " + this.resolveName1Up(tabela_relacional) + " get"+this.resolveName1Up(cl.getName())+"() {\n" + 
						"\t\treturn "+this.resolveName1Dw(cl.getName())+";\n" + 
						"\t}\n" + 
						"\tpublic void set"+this.resolveName1Up(cl.getName())+"("+ this.resolveName1Up(tabela_relacional) +" "+this.resolveName1Dw(cl.getName())+") {\n" + 
						"\t\tthis."+this.resolveName1Dw(cl.getName())+" = "+this.resolveName1Dw(cl.getName())+";\n" + 
						"\t}\n";
			}
		}
		if(tem_list) {
			content_setAndGet = content_setAndGet + conten_list_set_get;
			
		}
		
		String content_total = content_package + content_import + content + content_variaveis + content_setAndGet +"}";
		return content_total;
	}
	//resolver o tipo do sql para java
	private String resolveType(DatabaseMetadaHelper.Column column) {
		String result="String";
		switch (column.getTypeSql()) {
		    case Types.VARCHAR:
		    case Types.NVARCHAR:
		    case Types.CHAR:
		    case Types.NCHAR:
		    case Types.LONGVARCHAR:
		    case Types.LONGNVARCHAR:
		    case Types.STRUCT:
		    	result = "String";
		    	break;		    
		    case Types.SMALLINT:
		    case Types.INTEGER:	
		    case Types.TINYINT:
		    case Types.NUMERIC:
		        result = "Integer";
		        break;		        
		    case Types.BIGINT:
		        result = "BigInteger";
		        break;
		    case Types.DECIMAL:		  
		    	 result = "BigDecimal";
			        break;		   
		    case Types.REAL:
		    	 result = "Float";
			        break;			        
		    case Types.FLOAT:
		    case Types.DOUBLE:		   	
		    	result = "Double";
		    	break;
		    case Types.BIT:
		    case Types.BOOLEAN:
		    	result = "Boolean";
		    	break;		   
		    case Types.TIME:
		    case Types.TIME_WITH_TIMEZONE:		
		    case Types.TIMESTAMP:
		    case Types.TIMESTAMP_WITH_TIMEZONE:		       
		    case Types.DATE:
		        result = "Date";
		        break;
		    case Types.BINARY: 
		    case Types.VARBINARY:    
		    case Types.LONGVARBINARY: 
		    case Types.BLOB: 
		    case Types.CLOB: 
		    	result="byte[]";	        
		        break;
		    default:
		    	result=column.getType().toString().split(" ")[1];
		}
		return result;
	}
	
	
	//resolver o problema do nome da tabela
		public String resolveDAOName(String tabela_name) {
			String dao_name_class = "";
			for(String aux : tabela_name.split("_")){
				dao_name_class += aux.substring(0, 1).toUpperCase() + aux.substring(1).toLowerCase();
			}
			return dao_name_class;
		}
		
		
	private String resolveName1Up(String name) {
		String nome = "";
		for(String aux : name.split("_")){
			nome += aux.substring(0, 1).toUpperCase() + aux.substring(1).toLowerCase();
		}
		return nome.replaceAll(" ", "_");
	}
	
	private String resolveName1Dw(String name) {
		String nome = "";
		for(String aux : name.split("_")){
			nome += aux.substring(0, 1).toUpperCase() + aux.substring(1).toLowerCase();
		}
		
		return StringUtils.uncapitalize(nome.replaceAll(" ", "_"));
	}
	
	//descodifica o tipo de base de dados
	private String decreptyCode(String type) {
		String tipo_db = Core.decrypt(type, EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
		return tipo_db;
	}
	
	//criar a sequencia no oracle
	private String getSequenceOracle(String tablename, Config_env config) {
		String sql=" ";
		String sequence=" ";
		try {
			sql = "select " + 
				"seqs.sequence_name seq " + 
				"from all_tables tabs " + 
				"join all_triggers trigs " + 
				"on trigs.table_owner = tabs.owner " + 
				"and trigs.table_name = tabs.table_name " + 
				"join all_dependencies deps " + 
				"on deps.owner = trigs.owner " + 
				"and deps.name = trigs.trigger_name " + 
				"join all_sequences seqs " + 
				"on seqs.sequence_owner = deps.referenced_owner " + 
				"and seqs.sequence_name = deps.referenced_name " + 
				"where tabs.table_name='" + tablename + "'";
			java.sql.Connection con = Connection.getConnection(config);
		
			PreparedStatement st = con.prepareStatement(sql); 
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				sequence =  rs.getString("seq");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sequence;
	}
	
	//para gerar a variavel da lista
	private String GerarList(String nome_dao_pai, String nome_column_pai) {
			String content_variaveis = "\t@OneToMany(cascade = CascadeType.ALL, mappedBy = \"" + nome_column_pai + "\")\n" +
					"\tprivate List<"+nome_dao_pai+"> "+ this.resolveName1Dw(nome_dao_pai) +"List;\n";
			return content_variaveis;
	}
	
	//para gerar os gets and sets da lista
	private String GerarListSetGet(String nome_dao_pai, String nome_column_pai) {
		String content_setAndGet = "\t@XmlTransient\n" + 
				"\tpublic List<"+nome_dao_pai+"> get"+this.resolveName1Dw(nome_dao_pai)+"List() {\n" + 
				"\t\treturn "+this.resolveName1Dw(nome_dao_pai)+"List;\n" + 
				"\t}\n" + 
				"\tpublic void set"+this.resolveName1Dw(nome_dao_pai)+"List(List<"+nome_dao_pai + "> "+this.resolveName1Dw(nome_dao_pai)+"List) {\n" + 
				"\t\tthis."+this.resolveName1Dw(nome_dao_pai) +"List = "+this.resolveName1Dw(nome_dao_pai)+"List;\n" + 
				"\t}\n";
		return content_setAndGet;
	}
	
}
