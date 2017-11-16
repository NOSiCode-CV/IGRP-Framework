package nosi.core.webapp.webservices.biztalk;

public class GenericService_DevProxy implements nosi.core.webapp.webservices.biztalk.GenericService_Dev {
  private String _endpoint = null;
  private nosi.core.webapp.webservices.biztalk.GenericService_Dev genericService_Dev = null;
  
  public GenericService_DevProxy() {
    _initGenericService_DevProxy();
  }
  
  public GenericService_DevProxy(String endpoint) {
    _endpoint = endpoint;
    _initGenericService_DevProxy();
  }
  
  private void _initGenericService_DevProxy() {
    try {
      genericService_Dev = (new nosi.core.webapp.webservices.biztalk.BizTalkServiceInstanceLocator()).getBasicHttpBinding_ITwoWayAsync();
      if (genericService_Dev != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)genericService_Dev)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)genericService_Dev)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (genericService_Dev != null)
      ((javax.xml.rpc.Stub)genericService_Dev)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public nosi.core.webapp.webservices.biztalk.GenericService_Dev getGenericService_Dev() {
    if (genericService_Dev == null)
      _initGenericService_DevProxy();
    return genericService_Dev;
  }
  
  public nosi.core.webapp.webservices.biztalk.message.GenericServiceResponse genericRequest(nosi.core.webapp.webservices.biztalk.message.GenericServiceRequest part) throws java.rmi.RemoteException{
    if (genericService_Dev == null)
      _initGenericService_DevProxy();
    return genericService_Dev.genericRequest(part);
  }
  
  
}