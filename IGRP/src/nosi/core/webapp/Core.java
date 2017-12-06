package nosi.core.webapp;

import java.io.StringReader;
import java.rmi.RemoteException;
import javax.xml.bind.JAXB;

import org.apache.log4j.Logger;

import nosi.core.config.Config;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.webservices.biztalk.GenericService_DevProxy;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaBI;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaGeografia;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaHierarquicaCAE;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaSNIAC;
import nosi.core.webapp.webservices.biztalk.dao.Request;
import nosi.core.webapp.webservices.biztalk.dao.ServiceSerach;
import nosi.core.webapp.webservices.biztalk.message.GenericServiceRequest;
import nosi.core.webapp.webservices.biztalk.message.GenericServiceResponse;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import org.apache.log4j.Logger;
/**
 * @author: Emanuel Pereira
 * 13 Nov 2017
 */
public class Core {	

	static Logger log = Logger.getLogger(Core.class);
	
	/**
	 * log.fatal("fatal message");
		log.debug("debug message");
	 * */
	//Add Message Error
	public static void setMessageError(String msg){
		log.error(msg);
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, msg);
		
		
		
	}	
	public static void setMessageError(){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
	}	

	//Add Message Success
	public static void setMessageSuccess(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, msg);
		
	}
	
	//Add Message Success
	public static void setMessageSuccess(){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MESSAGE_SUCCESS);
	}
	
	//Add Message Info
	public static void setMessageInfo(String msg){
		log.info(msg);
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, msg);
		
		
		
	}

	//Add Message Info With Link
	public static void setMessageInfoLink(String msg,String link){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK, msg+"/#RESERVE#/"+link);
		
	}
	
	//Add Message Info With Link
	public static void setMessageInfoLink(String msg,String app,String page,String action){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK, msg+"/#RESERVE#/"+Config.getResolveUrl(app, page, action));
	}
		
	//Add Message Warning
	public static void setMessageWarning(String msg){
		log.warn(msg);
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, msg);
		
		
		
	}	
	
	//Get Config Property
	public static String getConfig(String name){
		nosi.webapps.igrp.dao.Config c = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", name).one();
		return c!=null?c.getValue():null;
	}
	
	//Get Current User
	public static nosi.webapps.igrp.dao.User getCurrentUser(){
		return (nosi.webapps.igrp.dao.User) Igrp.getInstance().getUser().getIdentity();
	}

	//Find User by ID
	public static nosi.webapps.igrp.dao.User findUserById(Integer id){
		return new nosi.webapps.igrp.dao.User().findOne(id);
	}
	
	//Find User by Username
	public static nosi.webapps.igrp.dao.User findUserByUsername(String userName){
		return new nosi.webapps.igrp.dao.User().find().andWhere("username", "=", userName).one();
	}
	
	//Find User by email
	public static nosi.webapps.igrp.dao.User findUserByEmail(String email){
		return new nosi.webapps.igrp.dao.User().find().andWhere("username", "=", email).one();
	}
	
	//Format date and return to Type String
	public static String convertDate(String date, String formatIn, String outputFormat) {
		return DateHelper.convertDate(date,formatIn,outputFormat);
	}
	
	//Format date and return to Type Date
	public static java.sql.Date formatDate(String data,String inputFormat,String outputFormat){
		return DateHelper.formatDate(data,inputFormat,outputFormat);
	}
	
	//Get Current Datetime (dd/MM/yyyy)
	public static String getCurrentDate(){
		return DateHelper.getCurrentDate();
	}

	//Get Current Datetime (User defined output format)
	public static String getCurrentDate(String outputFormat){
		return DateHelper.getCurrentDate(outputFormat);
	}
	
	//Get Current Datetime (dd/MM/yyyy HH:mm:ss)
	public static String getCurrentDataTime() {
		return DateHelper.getCurrentDataTime();
	}
	
	//Get Current Application Dad on Cookie
	public static String getCurrentDad(){
		return Permission.getCurrentEnv();
	}

	//Get Current Organization on Cookie
	public static Integer getCurrentOrganization(){
		return Permission.getCurrentOrganization();
	}

	//Get Current Profile on Cookie
	public static Integer getCurrentProfile(){
		return Permission.getCurrentPerfilId();
	}
	
	//Find Application By ID
	public static Application findApplicationById(Integer id){
		return new Application().findOne(id);
	}
	
	//Find Application By Dad
	public static Application findApplicationByDad(String dad){
		return new Application().find().andWhere("dad", "=", dad).one();
	}
	
	//Find Organization By ID
	public static Organization findOrganizationById(Integer id){
		return new Organization().findOne(id);
	}
	
	//Find Organization By Code
	public static Organization findOrganizationByCode(String code){
		return new Organization().find().andWhere("code", "=", code).one();
	}
	
	//Find Profile By ID
	public static ProfileType findProfileById(Integer id){
		return new ProfileType().findOne(id);
	}
	
	//Find Profile By Code
	public static ProfileType findProfileByCode(String code){
		return new ProfileType().find().andWhere("code", "=", code).one();
	}
	
	//Check permition transaction for current user
	public static boolean checkUserTransaction(String transaction){
		return new Transaction().getPermission(transaction);
	}
	
	public static Response getLinkReport(String code_report,Report rep){
		return new Report().invokeReport(code_report, rep);
	}
	
	public static GenericServiceResponse getBizTalkClient(String clientId,String transaction,String service,String args){
		GenericService_DevProxy proxy = new GenericService_DevProxy(); 
		GenericServiceRequest part = new GenericServiceRequest(clientId, transaction, service, args);
		try {
			return proxy.getGenericService_Dev().genericRequest(part);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static GenericServiceResponse getBizTalkClientService(ServiceSerach service){
		String args = new Request().prepare(service,"xml");
		System.out.println("args: "+args);
		return getBizTalkClient(service.getClientID(), service.getTransactionID(), service.getServiceID(), args);			
	}
	
	private static ServiceSerach processRequestBiztalkClientService(GenericServiceResponse response,ServiceSerach service){
		if(response.getStatus().equals("true")){
			String xml = response.getResult();
			StringReader input = new StringReader(xml);
			nosi.core.webapp.webservices.biztalk.dao.Response r = JAXB.unmarshal(input,nosi.core.webapp.webservices.biztalk.dao.Response.class);
			if(r.getRow()!=null){
				if(r.getRow().isStatus()){
					xml = xml.replaceAll("lista_nifs", "lista");
					xml = xml.substring(xml.indexOf("<lista>"), xml.indexOf("</lista>")+"</lista>".length());
					input = new StringReader(xml);
					service = JAXB.unmarshal(input, service.getClass());
					return service;
				}
			}
		}
		return null;
	}
	
	//Pesquia SNIAC via Biztalk
	public static PesquisaSNIAC getBizTalkPesquisaSNIAC(PesquisaSNIAC pesquisa){
		return (PesquisaSNIAC) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaSNIAC getBizTalkPesquisaSNIAC(Integer num_idnt_civil_pes, String num_registo_pes, String nome_pes, String data_nasc_pes,
			Integer id_tp_doc_pes){
		return getBizTalkPesquisaSNIAC(new PesquisaSNIAC(num_idnt_civil_pes, num_registo_pes, nome_pes, data_nasc_pes, id_tp_doc_pes));
	}	

	//Pesquia BI via Biztalk
	public static PesquisaBI getBizTalkPesquisaBI(PesquisaBI pesquisa){
		return (PesquisaBI) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaBI getBizTalkPesquisaBI(Integer bi, String nome){
		return getBizTalkPesquisaBI(new PesquisaBI(bi, nome));
	}	

	//Pesquia NIF via Biztalk
	public static PesquisaNIF getBizTalkPesquisaNIF(PesquisaNIF pesquisa){
		return (PesquisaNIF) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaNIF getBizTalkPesquisaNIF(Integer numero, String nome){
		return getBizTalkPesquisaNIF(new PesquisaNIF(numero, nome));
	}
	
	//Pesquia Nascimento via Biztalk
	public static PesquisaNascimento getBizTalkPesquisaNascimento(PesquisaNascimento pesquisa){
		return (PesquisaNascimento) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaNascimento getBizTalkPesquisaNascimento(String nome, Integer numero_registo, String data_nascimento){
		return getBizTalkPesquisaNascimento(new PesquisaNascimento(nome, numero_registo, data_nascimento));
	}	

	//Pesquia Hierarquia CAE via Biztalk
	public static PesquisaHierarquicaCAE getBizTalkPesquisaHierarquiaCAE(PesquisaHierarquicaCAE pesquisa){
		return (PesquisaHierarquicaCAE) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaHierarquicaCAE getBizTalkPesquisaHierarquiaCAE(String id, String codigo, String crpcae_id, String self_id){
		return getBizTalkPesquisaHierarquiaCAE(new PesquisaHierarquicaCAE(id, codigo, crpcae_id, self_id));
	}
	
	//Pesquia Geografia via Biztalk
	public static PesquisaGeografia getBizTalkPesquisaGeografia(PesquisaGeografia pesquisa){
		return (PesquisaGeografia) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaGeografia getBizTalkPesquisaGeografia(String id, String zona, String freguesia, String concelho, String ilha, String pais,
			String nivel_detalhe, String tp_geog_cd, String codigo_ine, String codigo, String self_id){
		return getBizTalkPesquisaGeografia(new PesquisaGeografia(id, zona, freguesia, concelho, ilha, pais, nivel_detalhe, tp_geog_cd, codigo_ine, codigo, self_id));
	}
	
	public static String encrypt(String content){
		return EncrypDecrypt.encrypt(content);
	}
	
	public static String decrypt(String content){
		return EncrypDecrypt.decrypt(content);
	}
	
	public static void main(String[] args){
		nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento p = Core.getBizTalkPesquisaNascimento("ANGELO BENJAMIM CARDOSO CORREIA", null, null);
		if(p!=null){
			System.out.println(p.getRowList());
		}
	}
}
