package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml for Map Esri
 *
 /*
<map_1 type="map" xml-type="form" gen-type="container" gen-group="">
            <fields>
                <map_1_url name="p_map_1_url" type="text" maxlength="4000">
                    <label>Map URL</label>
                    <value>/images/IGRP/IGRP2.3/core/formgen/types/containers/map/map.example.xml</value>
                </map_1_url>
            </fields>
        </map_1>
*/
public class IGRPMapEsri extends IGRPMapChart {

	public IGRPMapEsri(String tag_name) {
		super(tag_name);
		this.properties.put("type", "map");
	}

}
