package nosi.core.webapp.webservices.helpers;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

import java.lang.reflect.Type;
import java.util.List;


/**
 * Emanuel
 * 22 Jan 2018
 */
public class ResponseConverter {

   private ResponseConverter() {
   }

   public static String convertDaoToJson(Object dao) {
      return new Gson().toJson(dao);
   }

   public static <T> T convertJsonToDao(String jsonResult, Class<T> dao) {
      try {
         return new Gson().fromJson(jsonResult, dao);
      } catch (JsonSyntaxException ignored) {
      }
      return null;
   }

   public static List<?> convertJsonToListDao(String jsonResult, Type type) {
      return new Gson().fromJson(jsonResult, type);
   }

   public static List<?> convertJsonToListDao(String jsonResult, String keySearch, Type type) {
      try {
         var jsonObject = JsonParser.parseString(jsonResult).getAsJsonObject();
         if (jsonObject.has(keySearch)) {
            var jsonArrayString = jsonObject.get(keySearch).toString();
            return new Gson().fromJson(jsonArrayString, type);
         }
      } catch (Exception ignored) {
      }
      return null;
   }
}
