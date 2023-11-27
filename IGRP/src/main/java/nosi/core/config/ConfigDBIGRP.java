package nosi.core.config;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.dao_helper.SaveMapeamentoDAO;
import nosi.core.webapp.import_export_v2.common.Path;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.xml.XMLConstants;
import java.io.*;
import java.util.Iterator;
import java.util.Objects;
import java.util.Properties;

/**
 * @author: Emanuel Pereira
 * 15 Sep 2017
 */
public class ConfigDBIGRP {

    private String urlConnection;
    private String driverConnection;
    private String typeDb;
    private String username;
    private String password;
    private String name;
    private final String fileName;
    private String path;
    private static final ConfigDBIGRP CONFIG_DB_IGRP = new ConfigDBIGRP();
    private static final String FILE_NAME_IGRP_CONNECTION_CONFIG = "db_igrp_config.xml";
    private static final String FILE_NAME_IGRP_CONNECTION_CONFIG_H2 = "db_igrp_config_h2.xml";
    public static final String FILE_NAME_HIBERNATE_IGRP_CONFIG = ConfigApp.getInstance().getBaseConnection();

    //Default configuration for h2
    private ConfigDBIGRP() {
        this.driverConnection = "";
        this.typeDb = "h2";
        this.username = "root";
        this.password = "root";
        this.name = FILE_NAME_HIBERNATE_IGRP_CONFIG;
        this.fileName = FILE_NAME_IGRP_CONNECTION_CONFIG;
        this.path = Config.BASE_PATH_CONFIGURATION + "/" + "db" + "/";
    }

    public static ConfigDBIGRP getInstance() {
        return CONFIG_DB_IGRP;
    }

    public boolean save() {
        File file = new File(Objects.requireNonNull(getClass().getClassLoader().getResource(path + fileName)).getFile().replace("%20", " "));
        try (FileOutputStream out = new FileOutputStream(file)) {
            this.generateConfig().storeToXML(out, "store config igrp database");
            return this.saveIntoWorkSpace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Save config connection into worksapce
    public boolean saveIntoWorkSpace() {
        this.path = new Config().getWorkspace();

        if (Core.isNotNull(this.path) && FileHelper.fileExists(this.path)) {

            this.path += File.separator + new Config().getResourcesConfigDB();
            File file = new File(path + fileName);

            try (FileOutputStream out = new FileOutputStream(file)) {
                this.generateConfig().storeToXML(out, "store config igrp database");
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public void loadIGRPConnectionConfig() throws Exception {
        this.load(FILE_NAME_IGRP_CONNECTION_CONFIG);
    }

    public void loadIGRPConnectionConfigH2() throws Exception {
        this.load(FILE_NAME_IGRP_CONNECTION_CONFIG_H2);
    }

    private void load(String fileName) throws Exception {

        File file = new File(Objects.requireNonNull(getClass().getClassLoader().getResource(path + fileName)).getFile().replace("%20", " "));
        Properties props = new Properties();

        try (FileInputStream fis = new FileInputStream(file)) {
            props.loadFromXML(fis);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            throw new Exception("Database failed");
        }
        this.typeDb = props.getProperty("type_db");
        this.username = props.getProperty("username");
        this.password = props.getProperty("password");
        this.name = props.getProperty("connectionName");
        this.driverConnection = props.getProperty("driverConnection");
        this.urlConnection = props.getProperty("urlConnection");
    }

    private Properties generateConfig() {
        Properties props = new Properties();
        props.setProperty("type_db", this.typeDb);
        props.setProperty("username", this.username);
        props.setProperty("password", this.password);
        props.setProperty("connectionName", this.name);
        props.setProperty("driverConnection", this.driverConnection);
        props.setProperty("urlConnection", this.urlConnection);
        return props;
    }

    public String getType_db() {
        return typeDb;
    }

    public void setType_db(String typeDb) {
        this.typeDb = typeDb;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUrlConnection() {
        return urlConnection;
    }

    public void setUrlConnection(String urlConnection) {
        this.urlConnection = urlConnection;
    }

    public String getDriverConnection() {
        return driverConnection;
    }

    public void setDriverConnection(String driverConnection) {
        this.driverConnection = driverConnection;
    }


    @Override
    public String toString() {
        return "ConfigDBIGRP [urlConnection=" + urlConnection + ", driverConnection=" + driverConnection + ", type_db="
                + typeDb + ", username=" + username + ", password=" + password + ", name=" + name + ", fileName="
                + fileName + ", path=" + path + "]";
    }

    //Update de URL no ficheiro cfg.xml para conecção dinâmina com a base de dados IGRP Web Doc H2.

    public static boolean updateHibernateConfigFileOfApp(String connectionName) {
        boolean success = false;
        try {
            String fileName = connectionName + ".cfg.xml";
            String path = new Config().getPathConexao();
            String connectionURL = "jdbc:h2:file:" + Path.getRootPath() + "tutorial" + File.separator + "igrpweb_doc;AUTO_SERVER=TRUE";
            String cfgFileContent = SaveMapeamentoDAO.getHibernateConfig(path + File.separator + fileName);
            String fgFileContent = processHibernateConfigFileXml(cfgFileContent, connectionURL);
            if (fgFileContent != null && !fgFileContent.isEmpty())
                success = saveFiles(fileName, fgFileContent, path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    private static String processHibernateConfigFileXml(String xmlInput, String url) {
        String xmlOutput = null;
        try {
            SAXReader reader = new SAXReader();
            reader.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true); // Compliant
            reader.setFeature("http://xml.org/sax/features/external-general-entities", false);
            reader.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
            reader.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);

            org.dom4j.Document doc = reader.read(new StringReader(xmlInput));
            Element root = doc.getRootElement();

            // iterate through child elements of root
            Iterator<Element> i = root.elementIterator("session-factory");
            if (i.hasNext()) {
                Element element = i.next();
                Iterator<Element> j = element.elementIterator();
                while (j.hasNext()) {
                    Element property = j.next();
                    String attrName = property.attributeValue("name");
                    if (attrName != null && attrName.equals("hibernate.connection.url")) {
                        property.setText(url);
                    }
                }
            }
            xmlOutput = doc.asXML();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return xmlOutput;
    }

    private static boolean saveFiles(String fileName, String content, String path) throws IOException {
        return Core.isNotNull(content) && FileHelper.save(path, fileName, content);
    }


}
