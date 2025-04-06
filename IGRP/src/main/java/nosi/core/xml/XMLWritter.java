package nosi.core.xml;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 11, 2017
 * <p>
 * Description: class to build xml
 */

public class XMLWritter {

    protected ArrayList<String> listXml;
    private HashMap<String, Boolean> countAttr;
    private final StringBuilder xmlConstruct;
    private static final String LINE_SEPARATOR = "";

    public XMLWritter() {
        this.listXml = new ArrayList<>();
        this.countAttr = new HashMap<>();
        this.xmlConstruct = new StringBuilder();
    }

    public XMLWritter(String rootElement, String xslPath) {
        this();
        final String xslPathResolved = this.resolvePath(xslPath);
        this.xmlConstruct.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        this.xmlConstruct.append(LINE_SEPARATOR);
        this.xmlConstruct.append("<?xml-stylesheet href=\"").append(xslPathResolved).append("\" type=\"text/xsl\"?>");
        this.xmlConstruct.append(LINE_SEPARATOR);
        this.startElement(rootElement);
        this.closeLarger();
        this.xmlConstruct.append(LINE_SEPARATOR);
    }

    private String resolvePath(String xslPath) {
        if (xslPath == null)
            return "";
        return xslPath.contains("&amp;") ? xslPath : xslPath.replace("&", "&amp;");
    }

    public void startElement(String tag) {
        this.closeLarger();
        this.countAttr.put(tag, true);
        if (!this.listXml.isEmpty()) {
            this.xmlConstruct.append(LINE_SEPARATOR);
            String identityString = "";
            this.xmlConstruct.append(identityString);
        }
        this.xmlConstruct.append("<").append(tag);
        this.listXml.add(tag);
    }

    public void text(String text) {
        this.closeLarger();
        this.xmlConstruct.append(StringEscapeUtils.escapeXml11(text));
    }

    public void emptyTag(String tag) {
        this.closeLarger();
        this.xmlConstruct.append("<").append(tag).append("/>");
    }

    public void writeAttribute(String key, String value) {
        this.xmlConstruct.append(" ").append(key).append("=\"").append(StringEscapeUtils.escapeXml11(value)).append("\"");
    }

    public void setElement(String tag, String value) {
        if(this.countAttr==null)
            this.countAttr = new HashMap<>();
        if (value != null && !value.isEmpty()) {
            this.startElement(tag);
            this.text(value);
            this.countAttr.put(tag, false);
            this.endElement();
            return;
        }
        this.emptyTag(tag);
    }

    public void setElement(String tag, Object value) {
        if (value != null && !value.equals("")) {
            this.setElement(tag, value.toString());
            return;
        }
        this.emptyTag(tag);
    }

    private void closeLarger() {
        try {
            final String key = this.listXml.get(this.listXml.size() - 1);
            if (Boolean.TRUE.equals(this.countAttr.get(key))) {
                this.xmlConstruct.append(">");
                this.countAttr.remove(key);
            }
        } catch (Exception ignored) {
        }
    }

    public void endElement() {
        try {
            final int index = this.listXml.size() - 1;
            final String tag = this.listXml.get(index);
            this.closeLarger();
            this.xmlConstruct.append("</").append(tag).append(">");
            this.xmlConstruct.append(LINE_SEPARATOR);
            this.listXml.remove(index);
        } catch (Exception ignored) {
        }
    }

    //Add xml string

    public void addXml(String xml) {
        this.closeLarger();
        this.xmlConstruct.append("\n");
        this.xmlConstruct.append(xml);
    }

    public String getXml() {
        if (this.listXml!=null && !this.listXml.isEmpty()) {
            for (int i = this.listXml.size() - 1; i >= 0; i--) {
                this.xmlConstruct.append(LINE_SEPARATOR).append("</").append(this.listXml.get(i)).append(">");
            }
            this.listXml = null;
            this.countAttr = null;
        }
        return this.xmlConstruct.toString();
    }

    @Override
    public String toString() {
        return this.getXml();
    }

}
