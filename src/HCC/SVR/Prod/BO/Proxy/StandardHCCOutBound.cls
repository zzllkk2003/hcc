/// 
/// Author: Jeff Liu
/// Date: 2021-09-09 13:43:29
/// LastEditTime: 2021-09-10 12:18:58
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/SVR/Prod/BO/Proxy/StandardHCCOutBound.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.SVR.Prod.BO.Proxy.StandardHCCOutBound Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://172.19.86.111:52773/csp/healthshare/hcc/HCC.SVR.Prod.BS.HIPMessageServer.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "urn:hl7-org:v3";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "HIPMessageServer";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method HIPMessageServer(action As %String, message As %String, soapAction As %String) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("HIPMessageServer").Invoke($this,soapAction,.action,.message)
}

}
