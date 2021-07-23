Class HCC.SVR.Prod.BO.Proxy.StandardHCCOutBound Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://10.211.55.13:52774/csp/healthshare/mocksys/EMR.WS.PatientService.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "urn:hl7-org:v3";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "JiaoHuService";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method PatRegister(pat As HCC.SVR.Prod.BO.Proxy.s0.PatientReq) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("PatRegister").Invoke($this,"urn:hl7-org:v3/EMR.WS.PatientService.PatRegister",.pat)
}

}
