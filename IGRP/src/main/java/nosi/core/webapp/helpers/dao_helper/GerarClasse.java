package nosi.core.webapp.helpers.dao_helper;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.Connection;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp_studio.pages.crudgenerator.CRUDGeneratorController;

/**
 * Isaias.Nunes
 * Aug 22, 2019
 */
public class GerarClasse {
	public String gerarCode(String dad_name,String tbl_name, String clas_dao_name,List<DatabaseMetadaHelper.Column> columns, String schema,Config_env config) throws IOException {
		
		//definição das variaveis
		String content_import="";
		String content_package="";
		String content="";
		int cont = 0;
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
		if(tipo_db.equalsIgnoreCase(DatabaseConfigHelper.ORACLE)) {
			content = content + "@SequenceGenerator(name = \""+seq+"\",sequenceName =\""+seq+"\", initialValue = 1, allocationSize = 1)\n";
			content_import = content_import + "import javax.persistence.SequenceGenerator;\n";
		}
		content = content + "@NamedQuery(name=\""+clas_dao_name+".findAll\", query=\"SELECT b FROM "+clas_dao_name+" b\")\n";
		content = content + "public class "+ clas_dao_name + " extends BaseActiveRecord<" + clas_dao_name + "> implements Serializable{\n\n";
		content = content + "\tprivate static final long serialVersionUID = 1L;\n\n";
		
		String content_variaveis = "";
		for(DatabaseMetadaHelper.Column cl : columns) {
			if(cl.isPrimaryKey()) {
				content_variaveis = content_variaveis + "\t@Id\n";
				if(tipo_db.equalsIgnoreCase(DatabaseConfigHelper.ORACLE)) {
					content_variaveis = content_variaveis + "\t@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = \""+seq+"\")\n";
				}else {
					content_variaveis = content_variaveis +  "\t@GeneratedValue(strategy=GenerationType.IDENTITY)\n";
				}
						
						
				content_variaveis = content_variaveis +   "\t@Column(nullable="+( cl.isNullable() ? "true" : "false") +")\n"
						 + "\tprivate "+ this.resolveType(cl) +" " +cl.getName()+";\n";
			}else if(cl.isForeignKey()) {
				cont_import +=1;
				Map<String, String> fk_table_name = new DatabaseMetadaHelper().getForeignKeys(config, schema, tbl_name,dad_name);
				Map<String, String> fk_constrain_name = new DatabaseMetadaHelper().getForeignKeysConstrainName(config, schema, tbl_name,dad_name);
				
				content_variaveis = content_variaveis + "\t@ManyToOne\n"
						+ "\t@JoinColumn(name=\""+ cl.getName() +"\", foreignKey=@ForeignKey(name=\""+ fk_constrain_name.get(cl.getName())+"\"), nullable="+( cl.isNullable() ? "true" : "false") +")\n"+
						"\tprivate "+ this.resolveName(fk_table_name.get(cl.getName())) +" " +fk_table_name.get(cl.getName())+";\n";
				if(cont_import == 1) {
					content_import = content_import +"import javax.persistence.ManyToOne;\n" +
							"import javax.persistence.JoinColumn;\n" +
							"import javax.persistence.ForeignKey;\n\n";
				}
				
				//vereficar se a classe com dependencia existe
				//if(!Core.fileExists(new Config().getPathDAO(dad_name) + this.resolveName(fk_table_name.get(cl.getName()))+".java")) {
				//}
				
				new CRUDGeneratorController().generateDAO(config, schema, fk_table_name.get(cl.getName()), dad_name);
				System.out.println("nome de kes tabela dependente "+ fk_table_name.get(cl.getName())); 
				/*
				if(gerar) {
					Core.setMessageInfo("Também foi gerado classe dependente '"+ this.resolveName(fk_table_name.get(cl.getName())) +"'.");
				}
                */
			}else {
				content_variaveis = content_variaveis + "\t@Column(nullable="+( cl.isNullable() ? "true" : "false") +",length="+ cl.getSize()  +")\n"+
						"\tprivate "+ this.resolveType(cl) +" " +cl.getName()+";\n";
				
				/*if(ge.isGerar_list()) {
					//annotation OneToMany
					content_import = content_import + "import javax.persistence.OneToMany;\n"
													+ "import javax.persistence.FetchType;\n"
													+ "import javax.persistence.CascadeType;\n"
													+ "import java.util.List;\n\n";
					content_variaveis = content_variaveis + "\t@OneToMany(cascade = CascadeType.REMOVE, mappedBy=\""+ge.getVariavel_tabela()+"\",fetch=FetchType.EAGER)\n" + 
															"\tprivate List<"+ge.getTabela()+"> "+ge.getTabela().toLowerCase()+"s;";
					
				}*/
				if(this.resolveType(cl).equalsIgnoreCase("Date")) {
					cont +=1;
					if(cont == 1) {
						content_import = content_import + "import java.util.Date;\n";
					}
				}
			}
		}
		content_variaveis = content_variaveis +"\n";
		
		String content_setAndGet = "";
		for(DatabaseMetadaHelper.Column cl : columns) {
			if(!cl.isForeignKey()) {
				content_setAndGet = content_setAndGet + "\tpublic " + this.resolveType(cl) + " get"+this.resolveName(cl.getName())+"() {\n" + 
						"\t\treturn "+cl.getName()+";\n" + 
						"\t}\n" + 
						"\tpublic void set"+this.resolveName(cl.getName())+"("+ this.resolveType(cl) +" "+cl.getName()+") {\n" + 
						"\t\tthis."+cl.getName()+" = "+cl.getName()+";\n" + 
						"\t}\n";
			}else {
				Map<String, String> fk_table_name = new DatabaseMetadaHelper().getForeignKeys(config, schema, tbl_name,dad_name);
				content_setAndGet = content_setAndGet + "\tpublic " + this.resolveName(fk_table_name.get(cl.getName()).toUpperCase()) + " get"+this.resolveName(cl.getName())+"() {\n" + 
						"\t\treturn "+fk_table_name.get(cl.getName())+";\n" + 
						"\t}\n" + 
						"\tpublic void set"+this.resolveName(fk_table_name.get(cl.getName()))+"("+ this.resolveName(fk_table_name.get(cl.getName()).toUpperCase()) +" "+fk_table_name.get(cl.getName())+") {\n" + 
						"\t\tthis."+fk_table_name.get(cl.getName())+" = "+fk_table_name.get(cl.getName())+";\n" + 
						"\t}\n";
			}
		}
		String content_total = content_package + content_import + content + content_variaveis + content_setAndGet +"}";
		return content_total;
	}
	
	private String resolveType(DatabaseMetadaHelper.Column column) {
		String result="String";
		switch (column.getTypeSql()) {
		    case Types.VARCHAR:
		    case Types.NVARCHAR:
		    case Types.CHAR:
		    case Types.NCHAR:
		    case Types.STRUCT:
		    	result = "String";
		    	break;
		    case Types.NUMERIC:
		    case Types.SMALLINT:
		    case Types.INTEGER:
		    case Types.BIGINT:
		        result = "Integer";
		        break;
		    case Types.REAL:
		    case Types.FLOAT:
		    case Types.DOUBLE:
		    case Types.DECIMAL:
		    	result = "Double";
		    	break;
		    case Types.BIT:
		    	result = "boolean";
		    	break;
		    case Types.DATE:
		        result = "Date";
		        break;
		}
		return result;
	}
	
	private String resolveName(String name) {
		String nome = "";
		for(String aux : name.split("_")){
			nome += aux.substring(0, 1).toUpperCase() + aux.substring(1).toLowerCase();
		}
		return nome;
	}
	
	private String decreptyCode(String type) {
		String tipo_db = Core.decrypt(type, EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
		return tipo_db;
	}
	
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
				"where tabs.table_name='" + tablename+"'";
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
	
}
