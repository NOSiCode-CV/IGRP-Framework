package nosi.webapps.igrp_studio.pages.get_coordinates;

import nosi.core.gui.geographic.GetCoordinates;
import nosi.core.gui.geographic.MapViewer;
import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import com.google.gson.*;
import java.util.Map;
import java.util.Arrays;

public class Get_coordinatesController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		Get_coordinates model = new Get_coordinates();
		model.load();
		Get_coordinatesView view = new Get_coordinatesView();
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		String json = Core.getParam("jsonLookup"), key = "p_fwl_fieldname", keyValue = Core.getParam("p_fwl_fieldName"),
				latLng = Core.getParam("p_fwl_search"), center = Core.getParam("p_fwl_center");

		if (Core.isNull(latLng)) {
			latLng = Core.getParam("p_fwl_latLng");
		}

		if (Core.isNotNull(json)) {

			JsonObject jsonObject = new JsonParser().parse(json).getAsJsonObject();

			if (jsonObject.isJsonObject()) {
				for (Map.Entry<String, JsonElement> entry : jsonObject.entrySet()) {
					String value = entry.getValue().toString().replace("\"", "").trim();
					if (value.equals(key)) {
						keyValue = entry.getKey().toString().replace("\"", "").trim();
					}
					if (Core.isNull(center) && entry.getKey().equals("p_fwl_center")) {
						center = entry.getValue().toString().replace("\"", "").trim();
					}
				}
			}
		}
		String params = "&p_fwl_fieldName=".concat(keyValue).concat("&p_fwl_latLng=").concat(latLng)
				.concat("&p_fwl_center=").concat(center),

				url = Core.getIGRPLink("igrp_studio", "get_coordinates", "map") + params;

		view.map_os_1_data.setValue(url);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);
	}

	/* Start-Code-Block (custom-actions) *//* End-Code-Block */
	/*----#start-code(custom_actions)----*/
	public Response actionMap() throws IOException, IllegalArgumentException, IllegalAccessException {

		MapViewer map = new MapViewer();

		map.add("fullscreen", true);

		JsonObject bmap = new JsonObject();
		bmap.addProperty("default", true);
		bmap.addProperty("name", "GoogleSatellite");

		map.addBaseMap(bmap);

		GetCoordinates widget = new GetCoordinates();

		widget.setParentField(Core.getParam("p_fwl_fieldName"));

		String values = Core.getParam("p_fwl_latLng");

		String centerStr = Core.getParam("p_fwl_center");

		if (Core.isNotNull(centerStr)) {

			String[] centerArray = centerStr.split(",");

			map.add("zoom", centerArray[2]);

			JsonArray enquadramento = new JsonArray();

			enquadramento.add(Float.parseFloat(centerArray[0]));

			enquadramento.add(Float.parseFloat(centerArray[1]));

			map.add("center", enquadramento);

		}

		if (Core.isNotNull(values)) {
			String[] ary = values.split(",");

			double[] doubleValues = Arrays.stream(ary).mapToDouble(Double::parseDouble).toArray();

			widget.setLatLng(doubleValues);
		}

		map.addWidget(widget.toJson());

		String json = map.toString();

		this.format = Response.FORMAT_JSON;

		return this.renderView(json);

	}

	/*----#end-code----*/
}
