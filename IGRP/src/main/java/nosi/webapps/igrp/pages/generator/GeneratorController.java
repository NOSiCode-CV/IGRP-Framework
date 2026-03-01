package nosi.webapps.igrp.pages.generator;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.BufferedReader;
import java.io.IOException;
import java.security.SecureRandom;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

/*----#END-PRESERVED-AREA----*/

public class GeneratorController extends Controller{
	
	
	private final SecureRandom r= new SecureRandom();
	public Response actionIndex() throws IOException{		
		/*----#START-PRESERVED-AREA(INDEX)----*/
		this.isNoCached=true;		
		Generator model = new Generator();
		Integer id = Core.getParamInt("p_id_page");
		if(Core.isNotNullOrZero(id)){
			try{
				Action ac = new Action();
				ac = ac.findOne(id);	
				if(ac!=null){
					model.setGen_elements(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/formgen.config.txt?id=");
					model.setId_objeto(id);
					model.setId(ac.getId());
					model.setId_pai(ac.getApplication().getId());
					model.setLink_image(this.getConfig().getLinkImgBase().replace("\\", "/")+"images/IGRP/Config/img.list.php?name=");
					model.setVersion(ac.getVersion());
					String json = this.getConfig().getCurrentBaseServerPahtXsl(ac)+ File.separator +ac.getPage()+".json";
					if(FileHelper.fileExists(json)){
						json = this.getConfig().getCurrentResolvePathPage(ac.getApplication().getDad(),ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".json?v="+r.nextInt();
						model.setPage_form(json.replace("\\", "/"));
					}else if(FileHelper.fileExists(json.replaceAll(".json", ".xml"))){
						String xmlp = this.getConfig().getCurrentResolvePathPage(ac.getApplication().getDad(),ac.getPage(), ac.getVersion())+"/"+ac.getPage()+".xml?v="+r.nextInt();
						model.setPage_form(xmlp.replace("\\", "/"));
					}
					model.setPackage_(this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage()));
					model.setPage(ac.getPage());
					GeneratorView view = new GeneratorView(model);
					return this.renderView(view,true);
				}
			}catch(NumberFormatException e){
				return this.redirect("igrp", "error-page", "exception");
			}
		}
		return this.redirect("igrp", "error-page", "exception");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private static final Logger LOGGER = LoggerFactory.getLogger(GeneratorController.class);

	/**
	 * POST ?r=igrp/xslt-transform/transform
	 *
	 * Reads a JSON body with keys "xml", "xsl", and optional "xslParams",
	 * performs the XSLT transformation server-side and returns the HTML result.
	 */
	public Response actionTransform() {

		this.format   = Response.FORMAT_HTML;
		this.encoding = Response.CHARSET_UTF_8;

		try {
			// ── 1. Read raw POST body ──────────────────────────────────────
			StringBuilder sb = new StringBuilder();
			try (BufferedReader reader = Igrp.getInstance().getRequest().getReader()) {
				String line;
				while ((line = reader.readLine()) != null) {
					sb.append(line);
				}
			}
			String body = sb.toString().trim();

			if (body.isEmpty()) {
				return errorResponse("Request body is empty");
			}

			// ── 2. Parse JSON manually (no extra lib needed) ──────────────
			String xmlStr      = extractJsonString(body, "xml");
			String xslStr      = extractJsonString(body, "xsl");
			Map<String, String> xslParams = extractJsonParams(body, "xslParams");

			if (xmlStr == null || xmlStr.isEmpty()) {
				return errorResponse("Missing 'xml' in request body");
			}
			if (xslStr == null || xslStr.isEmpty()) {
				return errorResponse("Missing 'xsl' in request body");
			}

			// ── 3. Perform XSLT transformation ────────────────────────────
			String html = Controller.performXsltTransform(xmlStr, xslStr, xslParams);

			// ── 4. Return raw HTML ─────────────────────────────────────────
			return renderView(html);

		} catch (Exception e) {
			LOGGER.error("[XsltTransform] Transform failed: " + e.getMessage(), e);
			return errorResponse("Transform error: " + e.getMessage());
		}
	}

	// ── Helpers ────────────────────────────────────────────────────────────────

	private Response errorResponse(String message) {
		this.format = Response.FORMAT_HTML;
		Response resp = new Response();
		resp.setType(1);
		resp.setCharacterEncoding(Response.CHARSET_UTF_8);
		resp.setContentType(Response.FORMAT_HTML);
		resp.setContent("<!-- XSLT Transform Error: " + escapeHtmlComment(message) + " -->");
		return resp;
	}

	/**
	 * Extracts a string value from a simple flat JSON object.
	 * Handles basic escaped characters. Good enough for XML/XSL strings
	 * serialized by the browser's JSON.stringify().
	 */
	private String extractJsonString(String json, String key) {
		String search = "\"" + key + "\"";
		int keyIdx = json.indexOf(search);
		if (keyIdx == -1) return null;

		int colonIdx = json.indexOf(":", keyIdx + search.length());
		if (colonIdx == -1) return null;

		// Skip whitespace after colon
		int valueStart = colonIdx + 1;
		while (valueStart < json.length() && Character.isWhitespace(json.charAt(valueStart))) {
			valueStart++;
		}

		if (valueStart >= json.length()) return null;

		char firstChar = json.charAt(valueStart);

		if (firstChar == '"') {
			// String value — find the closing quote, respecting escapes
			StringBuilder result = new StringBuilder();
			int i = valueStart + 1;
			while (i < json.length()) {
				char c = json.charAt(i);
				if (c == '\\' && i + 1 < json.length()) {
					char next = json.charAt(i + 1);
					switch (next) {
						case '"':  result.append('"');  i += 2; break;
						case '\\': result.append('\\'); i += 2; break;
						case '/':  result.append('/');  i += 2; break;
						case 'n':  result.append('\n'); i += 2; break;
						case 'r':  result.append('\r'); i += 2; break;
						case 't':  result.append('\t'); i += 2; break;
						case 'u':
							// Unicode escape XXXX
							if (i + 5 < json.length()) {
								String hex = json.substring(i + 2, i + 6);
								try {
									result.append((char) Integer.parseInt(hex, 16));
								} catch (NumberFormatException ex) {
									result.append('\\').append(next);
								}
								i += 6;
							} else {
								result.append(c);
								i++;
							}
							break;
						default:
							result.append(next);
							i += 2;
					}
				} else if (c == '"') {
					break; // end of string
				} else {
					result.append(c);
					i++;
				}
			}
			return result.toString();
		}

		return null;
	}

	/**
	 * Extracts a simple string-to-string map from a JSON object nested
	 * under the given key. E.g. "xslParams": { "p1": "v1", "p2": "v2" }
	 */
	private Map<String, String> extractJsonParams(String json, String key) {
		Map<String, String> map = new HashMap<>();
		String search = "\"" + key + "\"";
		int keyIdx = json.indexOf(search);
		if (keyIdx == -1) return map;

		int braceOpen = json.indexOf("{", keyIdx + search.length());
		if (braceOpen == -1) return map;

		int braceClose = json.indexOf("}", braceOpen);
		if (braceClose == -1) return map;

		String inner = json.substring(braceOpen + 1, braceClose);

		// Simple tokenizer — split on commas, then parse "k":"v" pairs
		String[] pairs = inner.split(",");
		for (String pair : pairs) {
			int colon = pair.indexOf(':');
			if (colon == -1) continue;
			String k = pair.substring(0, colon).trim().replaceAll("^\"|\"$", "");
			String v = pair.substring(colon + 1).trim().replaceAll("^\"|\"$", "");
			if (!k.isEmpty()) {
				map.put(k, v);
			}
		}
		return map;
	}

	private String escapeHtmlComment(String s) {
		if (s == null) return "";
		return s.replace("--", "- -");
	}
	/*----#END-PRESERVED-AREA----*/
}