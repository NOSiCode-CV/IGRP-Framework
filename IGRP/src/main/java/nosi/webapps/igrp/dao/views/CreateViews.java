package nosi.webapps.igrp.dao.views;

import java.util.ArrayList;
import java.util.List;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.config.Config;
import nosi.core.webapp.databse.helpers.QuerySelect;

public class CreateViews extends BaseActiveRecord<CreateViews>{

	private static List<String> VIEWS = new ArrayList<>();
	static{
		VIEWS.add("CREATE OR REPLACE VIEW GLB_MV_ALL_MENUS(ID,DESCR,DESCR_MENU,SELF_FK,ENV_FK,ACTION_FK, ORDERBY) as SELECT  "
			+ "a.ID,"
			+ "a.DESCR descr,"
			+ "a.descr descr_menu,"
			+ "a.SELF_FK,"
			+ "a.ENV_FK,"
			+ "a.ACTION_FK,"
			+ "a.ORDERBY"
			+ " FROM  tbl_menu A,"
			+ "tbl_menu b"
			+ " WHERE  b.id = a.self_fk AND a.self_fk IS NOT NULL");
		
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_MV_MENU (ID,DESCR,SELF_FK,ENV_FK,ACTION_FK,ORDERBY,STATUS,FLG_BASE,TARGET) AS SELECT "
			+ "ID,"
			+ "DESCR,"
			+ "SELF_FK,"
			+ "ENV_FK,"
			+ "ACTION_FK,"
			+ "ORDERBY,"
			+ "STATUS,"
			+ "FLG_BASE,"
			+ "TARGET"
			+ " FROM tbl_menu");
		
		VIEWS.add(
			"CREATE OR REPLACE  VIEW GLB_V_MENU (ID, DESCR, DESCR_MENU,SELF_FK, ENV_FK,ACTION_FK, ORDERBY) AS SELECT "
			+ "a.ID,"
			+ "b.descr || ' - ' || a.DESCR descr,"
			+ "a.descr descr_menu,"
			+ "a.SELF_FK,"
			+ "a.ENV_FK,"
			+ "a.ACTION_FK,"
			+ "a.ORDERBY"
			+ " FROM glb_mv_menu a,"
			+ "glb_mv_menu b"
			+ " WHERE b.id     = a.self_fk"
			+ " AND a.self_fk IS NOT NULL");
	
		VIEWS.add("CREATE OR REPLACE VIEW GLB_V_ORG_MENU (ID, DESCR, ORDERBY, ENV_FK, SELF_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK, FLG_BASE) AS SELECT "
			+ "a.id,"
			+ "e.descr || ' - ' || a.descr descr,"
			+ "a.orderby,"
			+ "a.env_fk,"
			+ " a.self_fk,"
			+ "b.prof_type_fk,"
			+ " b.user_fk,"
			+ "'ALL' prof_code,"
			+ "'ALL PROFILE' prof_name,"
			+ "b.org_fk,"
			+ "a.flg_base"
			+ " FROM tbl_menu a,"
			+ "tbl_menu e,"
			+ "tbl_profile b"
			+ " WHERE e.id= a.self_fk"
			+ " AND a.self_fk IS NOT NULL"
			+ " AND a.id= b.type_fk"
			+ " AND b.TYPE         = 'MEN'"
			+ " AND b.prof_type_fk = 0");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_MV_PROFILE (PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, ORG_FK) AS SELECT "
			+ "PROF_TYPE_FK,"
			+ "USER_FK,"
			+ "TYPE,"
			+ "TYPE_FK,"
			+ "ORG_FK "
			+ " FROM tbl_profile");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_MV_PROFILE_TYPE (ID, DESCR, CODE, ENV_FK, SELF_FK, STATUS, ORG_FK) AS SELECT "
			+ "ID,"
			+ "DESCR,"
			+ "CODE,"
			+ "ENV_FK,"
			+ "SELF_FK,"
			+ "STATUS,"
			+ "ORG_FK "
			+ " FROM tbl_profile_type");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_PROFILE(ORG_FK, PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, PROF_CODE, PROF_NAME, PROF_NAME_DESC, ENV_FK, SELF_FK) AS "+
			" SELECT "
			+ "b.org_fk,"
		    + "b.prof_type_fk,"
		    + "b.user_fk,"
		    + "b.TYPE,"
		    + "b.type_fk,"
		    + "d.code prof_code,"
		    + "d.descr prof_name,"
		    + "d.code || ' - ' || d.descr prof_name_desc,"
		    + "d.env_fk,"
		    + "d.self_fk"
		    + " FROM   glb_mv_profile b,"
		    + "glb_mv_profile_type d "
		    + " WHERE   d.id = b.prof_type_fk");
		
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_PROFILE_MENU (ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_FK, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK,STATUS,TARGET,ENV_FK_PROF_TYPE,FLG_BASE) AS "+ 
			" SELECT a.id,"
			+ "e.descr descr,"
			+ "a.descr descr_menu,"
			+ "a.orderby,"
			+ "a.env_fk,"
			+ "a.self_fk,"
			+ "a.action_fk,"
			+ "b.prof_type_fk,"
			+ "b.user_fk,"
			+ "d.code prof_code,"
			+ "d.descr prof_name,"
			+ "b.org_fk,"
			+ "a.status,"
			+ "a.target,"
			+ "d.env_fk as env_fk_prof_type,"
			+ "e.flg_base"
			+ " FROM glb_mv_menu a,"
			+ "glb_mv_menu e,"
			+ "glb_mv_profile b,"
			+ "glb_mv_profile_type d "
			+ " WHERE e.id     = a.self_fk"
			+ " AND a.self_fk IS NOT NULL"
			+ " AND a.id       = b.type_fk"
			+ " AND b.TYPE     = 'MEN'"
			+ " AND d.id       = b.prof_type_fk");
	
		VIEWS.add(" CREATE OR REPLACE  VIEW GLB_V_USER_MENU (ID, DESCR, ORDERBY, ENV_FK, SELF_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS SELECT "
			+ " ID,DESCR,ORDERBY,ENV_FK,SELF_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK"
			+ " FROM GLB_V_PROFILE_MENU "
			+ " WHERE USER_FK<>0");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_PROF_MENU (ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_FK, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK,STATUS,TARGET,ENV_FK_PROF_TYPE,FLG_BASE) AS "+ 
		 	"SELECT  ID,"
		 	+ "DESCR,"
		 	+ "DESCR_MENU,"
		 	+ "ORDERBY,"
		 	+ "ENV_FK,"
		 	+ "SELF_FK,"
		 	+ "ACTION_FK,"
		 	+ "PROF_TYPE_FK,"
		 	+ "USER_FK,"
		 	+ "PROF_CODE,"
		 	+ "PROF_NAME,"
		 	+ "ORG_FK,"
		 	+ "STATUS,"
		 	+ "TARGET,"
		 	+ "env_fk_prof_type,"
			+ "FLG_BASE"
		 	+ " FROM  GLB_V_PROFILE_MENU"
		 	+ " WHERE  PROF_TYPE_FK <> 0 AND USER_FK = 0");
	
		VIEWS.add(" CREATE OR REPLACE  VIEW GLB_MV_TRANSACTION (ID, CODE, DESCR, ENV_FK, STATUS) AS "
			+ "select ID,CODE,DESCR,ENV_FK,STATUS from tbl_transaction");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_PROFILE_TRANS (ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS "+ 
		  " SELECT   a.id,"
		  + "a.code,"
		  + "a.descr,"
		  + "a.env_fk,"
		  + "b.prof_type_fk,"
		  + "b.user_fk,"
		  + "b.prof_code,"
		  + "b.prof_name,"
		  + "b.org_fk"
		  + " FROM   tbl_transaction a,"
		  + "glb_v_profile b"
		  + " WHERE   a.id = b.type_fk AND b.TYPE = 'TRANS'");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_PROF_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS"
			+ " SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK "
			+ " FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK<>0 AND USER_FK=0");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_ORG_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS "
			+ " SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK "
			+ " FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK=0");
	
		VIEWS.add("CREATE OR REPLACE  VIEW GLB_V_USER_TRANS (ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS "
			+ " SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK "
			+ " FROM GLB_V_PROFILE_TRANS WHERE USER_FK<>0");
	}
	
	public CreateViews(){
		this.createView();
	}
	
	private void createView(){
		QuerySelect q = new QuerySelect();
		String sqlViews = "";
		for(String sql:VIEWS){
			sqlViews+=sql+"; ";
		}
		q.setSql(sqlViews);
		q.executeQuery(Config.getBaseConnection()) ;
	}
}
