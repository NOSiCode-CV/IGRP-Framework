/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
 
public class NovoMenu extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_code")
	private String code;
	@RParam(rParamName = "p_descr")
	private String descr;
	@RParam(rParamName = "p_self_id")
	private int self_id;
	@RParam(rParamName = "p_env_fk")
	private int env_fk;
	@RParam(rParamName = "p_action_fk")
	private int action_fk;
	@RParam(rParamName = "p_target")
	private String target;
	@RParam(rParamName = "p_orderby")
	private int orderby;
	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_flg_base")
	private int flg_base;
	@RParam(rParamName = "p_link")
	private String link;
	@RParam(rParamName = "p_area")
	private String p_area;
	@RParam(rParamName = "p_img_src")
	private String p_img_src;
	@RParam(rParamName = "p_id")
	private int p_id;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text; 
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setCode(String code){
		this.code = code; 
	}
	public String getCode(){
		return this.code;
	}
	
	public void setDescr(String descr){
		this.descr = descr;
	}
	public String getDescr(){
		return this.descr;
	}
	
	public void setSelf_id(int self_id){
		this.self_id = self_id;
	}
	public int getSelf_id(){
		return this.self_id;
	}
	
	public void setEnv_fk(int env_fk){
		this.env_fk = env_fk;
	}
	public int getEnv_fk(){
		return this.env_fk;
	}
	
	public void setAction_fk(int action_fk){
		this.action_fk = action_fk;
	} 
	public int getAction_fk(){
		return this.action_fk;
	}
	
	public void setTarget(String target){
		this.target = target;
	}
	public String getTarget(){
		return this.target;
	}
	
	public void setOrderby(int orderby){
		this.orderby = orderby;
	}
	public int getOrderby(){
		return this.orderby;
	}
	
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	
	public void setFlg_base(int flg_base){
		this.flg_base = flg_base;
	}
	public int getFlg_base(){
		return this.flg_base;
	}
	
	public void setLink(String link){
		this.link = link;
	}
	public String getLink(){
		return this.link;
	}
	
	public void setP_area(String p_area){
		this.p_area = p_area;
	}
	public String getP_area(){
		return this.p_area;
	}
	
	public void setP_img_src(String p_img_src){
		this.p_img_src = p_img_src;
	}
	public String getP_img_src(){
		return this.p_img_src;
	}
	
	public void setP_id(int p_id){
		this.p_id = p_id;
	}
	public int getP_id(){
		return this.p_id;
	}
}
/*-------------------------*/