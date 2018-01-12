/**
 * BizTalkServiceInstanceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package nosi.core.webapp.webservices.biztalk;

public class BizTalkServiceInstanceLocator extends org.apache.axis.client.Service implements nosi.core.webapp.webservices.biztalk.BizTalkServiceInstance {

    public BizTalkServiceInstanceLocator() {
    }


    public BizTalkServiceInstanceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public BizTalkServiceInstanceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_ITwoWayAsync
    private java.lang.String BasicHttpBinding_ITwoWayAsync_address = "http://rai-gv-tbz-01/NOSIServices/GenericService_Dev.svc";

    public java.lang.String getBasicHttpBinding_ITwoWayAsyncAddress() {
        return BasicHttpBinding_ITwoWayAsync_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_ITwoWayAsyncWSDDServiceName = "BasicHttpBinding_ITwoWayAsync";

    public java.lang.String getBasicHttpBinding_ITwoWayAsyncWSDDServiceName() {
        return BasicHttpBinding_ITwoWayAsyncWSDDServiceName;
    }

    public void setBasicHttpBinding_ITwoWayAsyncWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_ITwoWayAsyncWSDDServiceName = name;
    }

    public nosi.core.webapp.webservices.biztalk.GenericService_Dev getBasicHttpBinding_ITwoWayAsync() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_ITwoWayAsync_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_ITwoWayAsync(endpoint);
    }

    public nosi.core.webapp.webservices.biztalk.GenericService_Dev getBasicHttpBinding_ITwoWayAsync(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            nosi.core.webapp.webservices.biztalk.BasicHttpBinding_ITwoWayAsyncStub _stub = new nosi.core.webapp.webservices.biztalk.BasicHttpBinding_ITwoWayAsyncStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_ITwoWayAsyncWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_ITwoWayAsyncEndpointAddress(java.lang.String address) {
        BasicHttpBinding_ITwoWayAsync_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (nosi.core.webapp.webservices.biztalk.GenericService_Dev.class.isAssignableFrom(serviceEndpointInterface)) {
                nosi.core.webapp.webservices.biztalk.BasicHttpBinding_ITwoWayAsyncStub _stub = new nosi.core.webapp.webservices.biztalk.BasicHttpBinding_ITwoWayAsyncStub(new java.net.URL(BasicHttpBinding_ITwoWayAsync_address), this);
                _stub.setPortName(getBasicHttpBinding_ITwoWayAsyncWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BasicHttpBinding_ITwoWayAsync".equals(inputPortName)) {
            return getBasicHttpBinding_ITwoWayAsync();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://NOSI.BizTalk.IntegrationLayer.Services", "BizTalkServiceInstance");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://NOSI.BizTalk.IntegrationLayer.Services", "BasicHttpBinding_ITwoWayAsync"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_ITwoWayAsync".equals(portName)) {
            setBasicHttpBinding_ITwoWayAsyncEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
