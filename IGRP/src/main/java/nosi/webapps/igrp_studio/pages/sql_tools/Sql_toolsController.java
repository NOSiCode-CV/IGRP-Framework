package nosi.webapps.igrp_studio.pages.sql_tools;

import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;

import javax.persistence.Tuple;
import javax.persistence.TupleElement;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/*----#end-code----*/

public class Sql_toolsController extends Controller {
    public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
        Sql_tools model = new Sql_tools();
        model.load();
        Sql_toolsView view = new Sql_toolsView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT  "));
		view.application.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
        /*----#start-code(index)----*/

        view.table_1.setVisible(false);
        view.application.setValue(new Application().getListApps());

        if (Core.isNotNull(model.getApplication())) {
            final Map<Object, Object> listDSbyEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getApplication()));
            if (listDSbyEnv.size() == 2) {
                model.setData_source(listDSbyEnv.keySet().toArray()[1].toString());
            }
            view.data_source.setValue(listDSbyEnv);
        }

        if (Core.isNotNull(model.getApplication()) && Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getSql())) {

            final Config_env configEnv = new Config_env().find()
                    .andWhere("application", "=", Core.toInt(model.getApplication(), -1))
                    .andWhere("id", "=", Core.toInt(model.getData_source(), -1)).one();

            final String sql = this.removeSpaceSql(model.getSql());

            if (!this.startWithSelect(sql)) {

                final ResultSet resultSet = Core.executeQuery(configEnv, sql);

                if (resultSet.hasError())
                    Core.setMessageError(resultSet.getError());
                else
                    Core.setMessageSuccess();

            } else {

                final long start = System.currentTimeMillis();

                final List<Tuple> data = Core.query(sql, configEnv).getResultList();

                final boolean generatedAliases = this.populateTable(view.table_1, data);

                Core.setMessageInfo((System.currentTimeMillis() - start) + " ms");
                if (generatedAliases) {
                    Core.setMessageWarning("Foram gerados aliases seguros para colunas sem um nome XML válido. "
                            + "Para controlar os nomes apresentados, use AS nome_da_coluna no SELECT.");
                }

                view.table_1.setVisible(true);
            }
        }
        /*----#end-code----*/
        view.setModel(model);
        return this.renderView(view);
    }

    public Response actionRun() throws IOException, IllegalArgumentException, IllegalAccessException {
        Sql_tools model = new Sql_tools();
        model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ListaPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
        /*----#start-code(run)----*/
        if (Core.isNotNull(model.getApplication()) && Core.isNotNull(model.getData_source()) && Core.isNotNull(model.getSql())) {
            return this.forward("igrp_studio", "Sql_tools", "index", this.queryString());
        }
        /*----#end-code----*/
        return this.redirect("igrp_studio", "ListaPage", "index", this.queryString());
    }



    /*----#start-code(custom_actions)----*/

    private boolean populateTable(IGRPTable table, List<Tuple> data) {

        if (null == data)
            return false;

        // LinkedHashSet to maintain the order of columns in the query and keep unique column names
        final Set<String> columnAliases = new LinkedHashSet<>();
        final List<String> xmlColumnAliases = new ArrayList<>();
        final Set<String> usedXmlColumnAliases = new HashSet<>();
        boolean generatedAliases = false;

        final XMLWritter xml = new XMLWritter();

        for (Tuple tuple : data) {
            xml.startElement("row");
            int columnIndex = 0;
            for (TupleElement<?> element : tuple.getElements()) {
                final String columnAlias;
                if (columnIndex < xmlColumnAliases.size()) {
                    columnAlias = xmlColumnAliases.get(columnIndex);
                } else {
                    columnAlias = this.createXmlColumnAlias(element.getAlias(), columnIndex + 1, usedXmlColumnAliases);
                    xmlColumnAliases.add(columnAlias);
                    generatedAliases = generatedAliases || !columnAlias.equals(element.getAlias());
                }

                columnAliases.add(columnAlias);
                xml.setElement(columnAlias, tuple.get(element));
                columnIndex++;
            }
            xml.endElement();
        }

        columnAliases.forEach(alias -> {
            final Field field = new TextField(null, alias);
            field.setLabel(alias);
            table.addField(field);
        });

        table.addRowsXMl(xml.toString());
        return generatedAliases;
    }

    private String createXmlColumnAlias(String sourceAlias, int columnIndex, Set<String> usedAliases) {
        final String originalAlias = sourceAlias == null ? "" : sourceAlias.trim();
        String alias = originalAlias;

        if (!alias.matches("[A-Za-z_][A-Za-z0-9_]*") || alias.regionMatches(true, 0, "xml", 0, 3)) {
            alias = alias.replaceAll("[^A-Za-z0-9_]+", "_").replaceAll("^_+|_+$", "");
            if (alias.isEmpty() || (!Character.isLetter(alias.charAt(0)) && alias.charAt(0) != '_'))
                alias = "column_" + (alias.isEmpty() ? columnIndex : alias);
            if (alias.regionMatches(true, 0, "xml", 0, 3))
                alias = "column_" + alias;
        }

        final String baseAlias = alias;
        int suffix = 2;
        while (!usedAliases.add(alias))
            alias = baseAlias + "_" + suffix++;

        return alias;
    }

    private boolean startWithSelect(String sql) {
        return sql.toLowerCase().startsWith("select");
    }

    private String removeSpaceSql(String sql) {
        if (Core.isNull(sql))
            return "";
        return sql.replaceAll("(\r\n|\n|\t)", " ").trim().replaceFirst(";+\\s*$", "");
    }
    /*----#end-code----*/
}
