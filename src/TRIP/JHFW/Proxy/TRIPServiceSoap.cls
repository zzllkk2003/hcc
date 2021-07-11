Class TRIP.JHFW.Proxy.TRIPServiceSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost:8090/WebService/TRIPService.asmx";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://eric.org/";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "TRIPService";

/// This service supports both SOAP 1.1 and SOAP 1.2.
Parameter SOAPVERSION;

/// 集成平台-交互服务接口参数说明：1、action，类型为字符串，服务编码传送给该参数。2、message，类型为字符流，服务请求消息的具体内容传给该参数。
Method HIPMessageServer(action As %String, message As %String) As %String [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("HIPMessageServer").Invoke($this,"http://eric.org/HIPMessageServer",.action,.message)
}

}
