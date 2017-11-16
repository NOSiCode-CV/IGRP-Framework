package nosi.core.webapp;

import java.io.StringReader;
import java.rmi.RemoteException;
import javax.xml.bind.JAXB;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.webservices.biztalk.GenericService_DevProxy;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaBI;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaGeografia;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaHierarquiaCAE;
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

/**
 * @author: Emanuel Pereira
 * 13 Nov 2017
 */
public class Core {

	private static final String URL_CLASS_CORE = "C:/Users/Yma/git/IGRP-Framework/IGRP/src/nosi/core/webapp/Core.java";
	public static void main(String[]args){
		
		PesquisaBI p = Core.getBizTalkPesquisaBI(12345, null);
		if(p!=null){
			System.out.println(p.getRowList());
		}else{
			System.err.println("Null");
		}
//		GenericServiceResponse response = getBizTalkClientService(new PesquisaSNIAC(null, null, "MARCIO CLAUDINO DE CARVALHO GOMES", null, null));
//		System.out.println(response.getResult());
//		String xml = "<rows><row><status>true</status><status_text/><lista><row><num_idnt_civil>19871002M002W</num_idnt_civil><num_registo>776002</num_registo><data_nasc>02-10-1987</data_nasc><nome>Márcio Claudino De Carvalho Gomes Lopes</nome><nome_completo>Márcio Claudino De Carvalho Gomes Lopes</nome_completo><nome_proprio>Márcio Claudino</nome_proprio><nome_apelido>De Carvalho Gomes Lopes</nome_apelido><nome_mae>Maria Filomena Soares De Carvalho</nome_mae><nm_mae_proprio>Maria Filomena</nm_mae_proprio><nm_mae_apelido>Soares De Carvalho</nm_mae_apelido><nome_pai>Arlindo Gomes Lopes</nome_pai><nm_pai_proprio>Arlindo</nm_pai_proprio><nm_pai_apelido>Gomes Lopes</nm_pai_apelido><estado_documento/><estado_pessoa/><perda_nasc/><id_pessoa>1987100201874</id_pessoa><natuaralidade>CABO VERDE</natuaralidade><natuaralidade_id>238</natuaralidade_id><nacionalidade>CABO VERDE</nacionalidade><nacionalidade_id>238</nacionalidade_id><sexo>M</sexo><local_nasc>SANTIAGO</local_nasc><local_nasc_id>2387</local_nasc_id><altura>1.75</altura><estado_civil>S</estado_civil><sinais_partic/><indicacoes/><grupo_profissional>Profissoes_Elementares</grupo_profissional><profissao>ENFORMATICO</profissao><num_nic>19871002M002W</num_nic><bi/><num_passaporte>PA000356</num_passaporte><nif/><data_emissao/><data_validade/><data_inscricao/><local_emissao/><fotografia/><imprissao_digt_esq/><imprissao_digt_dir/><assinatura/></row></lista></row></rows>";
//		processRequestBiztalkClientService(xml,new PesquisaSNIAC());
		
//		if(r.getRow()!=null){
//			if(r.getRow().isStatus()){
//				if(r.getRow().getLista()!=null){
////					for(RowList p:r.getRow().getLista().getRowList()){
////					if(service instanceof PesquisaSNIAC){
////						PesquisaSNIAC p = (PesquisaSNIAC) service;
//						System.out.println(r.getRow().getLista());
////					}
////					}
//				}
//			}
//		}
		//		getBizTalkClient("IGRP_JAVA", "XAUdxHFzk2Hy7FLinvMIbb4lWBakd5X0Vs+GQObYTnPPHsSsuHF9HGm2pbWUGGg+", "5004281", arg);
//		File file = new File(URL_CLASS_CORE);
//		try {
//		    URL[] urls = new URL[]{file.toURL()};
//		    Properties p = new Properties();
//		    for(Method method:new URLClassLoader(urls).loadClass("nosi.core.webapp.Core").getDeclaredMethods()){
//		    	String methodName = method.getName()+"(";
//		    	for(Parameter param:method.getParameters())
//		    		methodName +=param.getName()+",";
//		    	methodName = methodName.substring(0, methodName.length()-1);
//		    	methodName +=");";
//		    	p.put(methodName, methodName);
//		    }
//		    System.out.println(new Gson().toJson(p));
//		} catch (MalformedURLException e) {
//		} catch (ClassNotFoundException e) {
//		}
	}
	
	//Add Message Error
	public static void setMessageError(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, msg);
	}	

	//Add Message Success
	public static void setMessageSuccess(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, msg);
	}
	
	//Add Message Info
	public static void setMessageInfo(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, msg);
	}

	//Add Message Warning
	public static void setMessageWarning(String msg){
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
		if(service instanceof PesquisaBI){//Se for Pesquisa BI
			String args = new Request().prepare(service,"xml");
			return getBizTalkClient("IGRP_JAVA", "XAUdxHFzk2Hy7FLinvMIbb4lWBakd5X0Vs+GQObYTnPPHsSsuHF9HGm2pbWUGGg+", "5004281", args);			
		}
		else if(service instanceof PesquisaSNIAC){//Se for Pesquisa SNIAC
			String args = new Request().prepare(service,"xml");
			return getBizTalkClient("IGRP_JAVA", "XAUdxHFzk2Hy7FLinvMIbXUJehXlQ4ZYwdEHmzQeMEH2S9u8bxj89amyJRtP+9Hm", "5004599", args);			
		}	
		return null;
	}
	
	private static ServiceSerach processRequestBiztalkClientService(GenericServiceResponse response,ServiceSerach service){
		if(response.getStatus().equals("true")){
			String xml = response.getResult();
			StringReader input = new StringReader(xml);
			nosi.core.webapp.webservices.biztalk.dao.Response r = JAXB.unmarshal(input,nosi.core.webapp.webservices.biztalk.dao.Response.class);
			if(r.getRow()!=null){
				if(r.getRow().isStatus()){
					xml = xml.substring(xml.indexOf("<lista>"), xml.indexOf("</lista>")+"</lista>".length());
					input = new StringReader(xml);
					service = JAXB.unmarshal(input, service.getClass());
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
	public static PesquisaHierarquiaCAE getBizTalkPesquisaHierarquiaCAE(PesquisaHierarquiaCAE pesquisa){
		return (PesquisaHierarquiaCAE) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaHierarquiaCAE getBizTalkPesquisaHierarquiaCAE(Integer id, String codigo, Integer crpcae_id, Integer self_id){
		return getBizTalkPesquisaHierarquiaCAE(new PesquisaHierarquiaCAE(id, codigo, crpcae_id, self_id));
	}
	
	//Pesquia Geografia via Biztalk
	public static PesquisaGeografia getBizTalkPesquisaGeografia(PesquisaGeografia pesquisa){
		return (PesquisaGeografia) processRequestBiztalkClientService(getBizTalkClientService(pesquisa),pesquisa);
	}
	
	public static PesquisaGeografia getBizTalkPesquisaGeografia(Integer id, String zona, String freguesia, String concelho, String ilha, String pais,
			String nivel_detalhe, String tp_geog_cd, String codigo_ine, String codigo, String self_id){
		return getBizTalkPesquisaGeografia(new PesquisaGeografia(id, zona, freguesia, concelho, ilha, pais, nivel_detalhe, tp_geog_cd, codigo_ine, codigo, self_id));
	}
}
