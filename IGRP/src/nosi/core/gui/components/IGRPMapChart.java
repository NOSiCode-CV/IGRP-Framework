package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml for Map Chart
 *
 /*
<mapchart_1 type="mapchart" xml-type="form" gen-type="container" gen-group="">
    <fields>
        <mapchart_1_basemap name="p_mapchart_1_basemap" type="text" maxlength="4000">
            <label>Basemap</label>
            <value>/images/IGRP/IGRP2.3/utils/geo/basemap/caboverde/json.geojson</value>
        </mapchart_1_basemap>
        <mapchart_1_data name="p_mapchart_1_data" type="text" maxlength="4000">
            <label>Data</label>
            <value>/images/IGRP/IGRP2.3/utils/geo/data/data.json</value>
        </mapchart_1_data>
        <mapchart_1_config name="p_mapchart_1_config" type="text" maxlength="4000">
            <label>Configuration</label>
            <value>/images/IGRP/IGRP2.3/utils/geo/config/config2.json</value>
        </mapchart_1_config>
    </fields>
</mapchart_1>
*/

public class IGRPMapChart extends IGRPForm {

	public IGRPMapChart(String tag_name) {
		super(tag_name);
		this.properties.put("type", "mapchart");
	}
}
