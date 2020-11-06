package nosi.core.webapp.webservices.helpers;

import java.lang.reflect.Type;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;


/**
 * Emanuel
 * 22 Jan 2018
 */
public class ResponseConverter {

	public static String convertDaoToJson(Object dao) {
		Gson gson = new Gson();
		return gson.toJson(dao);
	}
	
	public static Object convertJsonToDao(String jsonResult, Class<?> dao) {
		Object response = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			Gson gson = new Gson();
			response = gson.fromJson(jsonObject.toString(), dao);
		} catch (JSONException e) {
		}
		return response;
	}
	
	public static <T> List<? extends Object> convertJsonToListDao(String jsonResult, Type type) {
		List<? extends Object> list = null;
		Gson gson = new Gson();
		list = gson.fromJson(jsonResult, type);
		return list;
	}
	
	public static <T> List<? extends Object> convertJsonToListDao(String jsonResult,String keySearch, Type type) {
		List<? extends Object> list = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			if(jsonObject.has(keySearch)) {
				JSONArray aux = jsonObject.getJSONArray(keySearch);
				Gson gson = new Gson();
				list = gson.fromJson(aux.toString(), type);
			}
		} catch (JSONException e) {
		}
		return list;
	}
	
}
