package nosi.core.webapp;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.stream.StreamResult;

import org.jsoup.Jsoup;
import org.jsoup.helper.W3CDom;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import nosi.core.config.Config;
import nosi.core.webapp.helpers.GUIDGenerator;
import nosi.core.webapp.helpers.ReflectionHelper;
import nosi.core.webapp.helpers.Route;
import nosi.core.webapp.helpers.TransformHelper;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.RepInstance;
import nosi.webapps.igrp.dao.RepTemplate;
import org.apache.commons.lang3.StringUtils;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
/**
 * 
 * Use the functions getLinkReport and other to manage and invoke reports.
 * 
 * @author: Emanuel Pereira
 * 9 Oct 2017
 */
public class Report extends Controller{

	public static final String XSLXML_PRV = "0" ;
	public static final String XSLXML_SAVE = "1" ;
	public static final String PDF_PRV = "2"; //PDF Preview
	public static final String PDF_SAVE = "3"; //PDF Save to Clob
	
	private final Map<String,Object> params = new HashMap<>();
	private final StringBuilder qStr = new StringBuilder();
	private String link;
	private String contraProva;	

	public Response invokeReport(String code_report,Report rep){
		return invokeReport(code_report,rep,XSLXML_SAVE);
	}	
	public Response invokeReportPDF(String code_report,Report rep){		
		return invokeReport(code_report,rep,PDF_SAVE);		
	}
	@SuppressWarnings("unchecked")
	public Response invokeReport(String code_report,Report rep,String type) {
		
	qStr.append("&p_type=").append(type); // se for 0 - preview, se for 1 - registar ocorencia ,2-retornar PDF preview 3 - retornar PDF e save clob
	RepTemplate rt = new RepTemplate().find().andWhere("code", "=", code_report).one();
	qStr.append("&p_rep_id=").append(rt.getId());
	String contra_prova=rep.getContraProva();
	if(Core.isNull(contra_prova))
		 contra_prova = Report.generateContraProva("nosi.webapps."+rt.getApplication().getDad().toLowerCase());
	
	qStr.append("&ctpr=").append(Core.encryptPublicPage(contra_prova));
	try {
		if(rep!=null) 
			for(Entry<String, Object> p : rep.getParams().entrySet()) 
				if(!(p.getValue() instanceof List)) {
					if(p.getValue() != null && !p.getValue().toString().equals("?")) { 
						if (p.getKey().equals("isPublic") && p.getValue().equals("1")) 
							qStr.append("&").append(p.getKey()).append("=").append(p.getValue()); // isPublic=1 :-)
						else 
							qStr.append("&name_array=").append(p.getKey()).append("&value_array=").append(URLEncoder.encode("" + p.getValue(), StandardCharsets.UTF_8));
					}
				}else {
					List<Object> parms = (List<Object>) p.getValue(); 
					for(Object v : parms) 
						qStr.append("&name_array=").append(p.getKey()).append("&value_array=").append(URLEncoder.encode(v.toString(), StandardCharsets.UTF_8));
				}
		
		
			Response redirect = this.redirect("igrp_studio", "WebReport", "preview" + qStr,this.queryString());
			redirect.setContent(contra_prova);
			return redirect;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}	

	
	public Report getLinkReport(String code_report){
		return getLinkReport(code_report, false); 
	}

	public Report getLinkReport(String code_report, boolean isPublic){
		Report rep = new Report(); 
		RepTemplate rt = new RepTemplate().find().andWhere("code", "=", code_report).one();
		String contra_prova = Report.generateContraProva("nosi.webapps."+rt.getApplication().getDad().toLowerCase());
		if(isPublic) 
			Core.setAttribute("isPublic", "1"); 	
		
		rep.setLink(Route.getResolveUrl("igrp_studio", "WebReport", "preview&ctpr="+Core.encryptPublicPage(contra_prova)+"&p_rep_id="+rt.getId()+"&p_type="+XSLXML_SAVE)); 
		rep.setContraProva(contra_prova);
		return rep;
	}
	
	public static Response getLinkReport(String code_report,Report rep){
		return new Report().invokeReport(code_report, rep);
	}
	
	public Report addParam(String name,Object value){
		this.params.put(name, value);
		return this;
	}

	public Map<String, Object> getParams() {
		return params;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	public Report getLinkReport(String code_report, QueryString<String, Object> queryString) {
		Report rep = new Report();
		RepTemplate rt = new RepTemplate().find().andWhere("code", "=", code_report).one();
		String contra_prova = Report.generateContraProva("nosi.webapps."+rt.getApplication().getDad().toLowerCase());
		
		rep.setLink(Route.getResolveUrl("igrp_studio", "WebReport", "preview&ctpr="+Core.encryptPublicPage(contra_prova)+"&p_rep_id="+rt.getId()+"&p_type="+XSLXML_SAVE)); 
		if(queryString!=null) {
			queryString.getQueryString().forEach((key, value) -> rep.addParam(key, value.get(0)));
		}
		rep.setContraProva(contra_prova);
		return rep;
	}
	
	public String getLinkContraProva(String contraProva) {		
		return getLinkContraProva(contraProva,null, XSLXML_SAVE,null);
	}
	
	public String getLinkContraProva(String contraProva,String appCodeId, String outType,Boolean pdfToDownload) {
		contraProva=Core.encryptPublicPage(contraProva);
		StringBuilder querys = new StringBuilder("&ctprov="+contraProva);
		if(Core.isNotNull(appCodeId))
			querys.append("&did=").append(appCodeId);
		if(outType.equals(PDF_PRV)) {
			querys.append("&out="+PDF_PRV);
			if(Core.isNotNull(pdfToDownload) && Boolean.TRUE.equals(pdfToDownload))
				querys.append("&todwn=").append(pdfToDownload);
		}		
		return Core.getHostName()+"?r=igrp_studio/web-report/get-contraprova"+querys;
	}
	
	public Response getRepContraProvaPDF(String contraProva,String appCodeID,Boolean pdfToDownload) throws TransformerFactoryConfigurationError, IOException {
		return processRepContraProva(contraProva, appCodeID, PDF_PRV, pdfToDownload+"");
	}

	public static String generateContraProva(String packageFind) {
		List<Class<?>> allClasses = ReflectionHelper.findClassesByInterface(ReportKey.class,packageFind);
		if(allClasses != null) {
			for(Class<?> c:allClasses) {
				try {
					ReportKey key = (ReportKey) c.getDeclaredConstructor().newInstance(); 
					return key.getKeyGenerate();
				} catch (Exception e) {
					return  GUIDGenerator.getGUIDUpperCase();
				}	
			}
		}
		return GUIDGenerator.getGUIDUpperCase();
	}



	/**
	 * @return the contraProva
	 */
	public String getContraProva() {
		return contraProva;
	}

	/**
	 * @param contraProva the contraProva to set
	 */
	public Report setContraProva(String contraProva) {
		this.contraProva = contraProva;
		return this;
	}
	
	/**
	 * @param id
	 * @param xml
	 * @return 
	 * @throws TransformerFactoryConfigurationError
	 * @throws IOException 
	 */
	public Response processPDF(String filename, CLob cLobXSL, String xml, String toDownload) throws TransformerFactoryConfigurationError, IOException {
		try {
			ByteArrayOutputStream actual;
			String dadBase = new Config().getLinkImgBase().replaceFirst("/", "");
			xml = xml.replace("<link_img>/", "<link_img>");
			xml = xml.replace("../images/", dadBase + "images/");			
			String xsl = new String(cLobXSL.getC_lob_content());
			xsl = xsl.replaceFirst("3.4.1/css/", "4.0/css/")			
					.replace("../images/", dadBase + "images/")
					.replace("/IGRP/images/IGRP/IGRP2.3/", dadBase + "images/IGRP/IGRP2.3/")	
					.replace("/IGRP-Template/images/IGRP/IGRP2.3/", dadBase + "images/IGRP/IGRP2.3/")	
					.replaceFirst("@page \\{", "@page {margin:0;")
					;
			
		//XML + XSL >> HTML
			final var transformHelper = new TransformHelper();
			StreamResult result = transformHelper.transformXMLXSL2HTML(xml, xsl);
			String baseUri4 = FileSystems.getDefault().getPath(new Config().basePathServer()).toUri().toString();
			baseUri4 = baseUri4.replace(dadBase, "");
			Document doc = html5ParseDocument(result.getWriter().toString(), baseUri4);	
			
			//HTML >> PDF
			actual = transformHelper.transformHTML2PDF(doc, baseUri4);
			
			
		//Ver PDF ou Download direto
		
			return this.xSend(actual.toByteArray(),filename+".pdf", "application/pdf",Boolean.parseBoolean(toDownload));
			
		} catch (TransformerConfigurationException tce) {
			// Error generated by the parser
			System.err.println("\n** Transformer Factory error");
			System.err.println("   " + tce.getMessage());

			// Use the contained exception, if any
			Throwable x = tce;

			if (tce.getException() != null) {
				x = tce.getException();
			}

			x.printStackTrace();
		} catch (TransformerException te) {
			// Error generated by the parser
			System.err.println("\n** Transformation error");
			System.err.println("   " + te.getMessage());

			// Use the contained exception, if any
			Throwable x = te;

			if (te.getException() != null) {
				x = te.getException();
			}

			x.printStackTrace();
		} catch (SAXException sxe) {
			// Error generated by this application
			// (or a parser-initialization error)
			Exception x = sxe;

			if (sxe.getException() != null) {
				x = sxe.getException();
			}

			x.printStackTrace();
		} catch (ParserConfigurationException pce) {
			// Parser with specified options can't be built
			pce.printStackTrace();
		} catch (IOException ioe) {
			// I/O error
			ioe.printStackTrace();
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	public Document html5ParseDocument(String inputHTML, String baseUri){
	    org.jsoup.nodes.Document doc;
	   doc = Jsoup.parse(inputHTML,baseUri);
		
	    
		Elements imgs = doc.select("img");
		imgs.forEach(i -> {
			if (i.attr("src").contains("?r=")) {
				// webapps?r=igrp/File/get-file&uuid=821ccc01f84143b68df9ecc6fa2bb9d4&dad=sistema_de_avaliacao_igrpweb
				String uuid = StringUtils.substringBetween(i.attr("src"), "get-file&uuid=", "&");
				if (Core.isNotNull(uuid)) {
					CLob file = Core.getFileByUuid(uuid);				
					if (file != null) {
						i.attr("src", "data:" + file.getMime_type() + ";base64, "+ Base64.getEncoder().encodeToString(file.getC_lob_content()));
					}
				}else {
					String foto = StringUtils.substringBetween(i.attr("src"), "p_file_name=", "&");
					if (Core.isNotNull(foto)) {
						String dadBase = new Config().getLinkImgBase().replaceFirst("/", "");
						String dad = StringUtils.substringAfter(i.attr("src"), "dad=");
						if(Core.isNull(dad))
							dad = StringUtils.substringAfter(i.attr("src"), "env=");
						i.attr("src", dadBase + "images/IGRP/IGRP2.3/assets/img/"+dad+"/reports/"+foto);					
					}
				}
			}else
				i.attr("src",i.attr("src").replace("%0A", ""));
		});
		Element content = doc.getElementById("content");
		Elements styleD = null;
		if (content != null) {
			styleD = content.getElementsByTag("style");
			if (styleD != null)
				doc.getElementsByTag("head").append(styleD + "");

			Elements qrcode = content.select("div.containerQrcode").tagName("object").attr("type", "image/barcode")
					.attr("style", "width:100px;height:100px;");
			qrcode.attr("value", Core.isNotNull(qrcode.attr("url")) ? qrcode.attr("url") : "Nothing/Nada");
			qrcode.removeAttr("url");
			
			if (styleD != null) {
				styleD.remove();
			}
		}

		Element footer = doc.getElementById("footer");
		if (footer != null) {				
		
		// source : https://jsoup.org/apidocs/org/jsoup/select/Selector.html
			Elements scriptVar = doc.select("script");
			scriptVar.forEach(s -> {
				if(s.html().startsWith("var qrcodeResult =") ) {
						String qrlink= StringUtils.substringBetween(s.html(), "var qrcodeResult = '", "';"); 
					doc.select("div.containerQrcode, div#containerQrcode").attr("style", "padding:0;width:26mm;margin-bottom:5px;").append("<object value=\""+qrlink+"\" url=\"\" type=\"image/barcode\"style=\"width:100px;height:100px;\" ></object>\n")
					;
                }
			});
		}
		return new W3CDom().fromJsoup(doc);
	  }
	/**
	 * @param contraprova
	 * @param dad
	 * @param outType PDF_SAVE, XSLXML_SAVE
	 * @param toDownload
	 * @return
	 * @throws TransformerFactoryConfigurationError
	 * @throws IOException
	 */
	public Response processRepContraProva(String contraprova, String id, String outType, String toDownload)
			throws TransformerFactoryConfigurationError, IOException {
		if(Core.isNull(contraprova)) {
			Core.setMessageError("[ EN ] - The number contraprova is empty. <br>[ PT ] - O número de contraprova está vazio.");		
			return this.redirect("igrp", "ErrorPage", "exception","&target=_blank");
		}
		RepInstance ri = new RepInstance().find().andWhere("contra_prova", "=",contraprova)
				.andWhere("application.id", "=",Integer.getInteger(id, null)).orderByDesc("id").one();			
		String content = "";
		if(ri!=null && ri.getTemplate()!=null && !ri.hasError()){
           return switch (outType) {
              case PDF_PRV, PDF_SAVE ->
                      new Report().processPDF(ri.getXsl_content().getName().replace(".xsl", ""), ri.getXsl_content(), new String(ri.getXml_content().getC_lob_content()), toDownload);
              default -> {
                 content = new String(ri.getXml_content().getC_lob_content());
                 yield this.renderView(content);
              }
           };
			
		}
		Core.setMessageError("[ EN ] - The document #("+contraprova+") has not been found. <br>[ PT ] - O documento #("+contraprova+") não foi encontrado.");
		return this.redirect("igrp", "ErrorPage", "exception","&target=_blank");
	}
	
}
