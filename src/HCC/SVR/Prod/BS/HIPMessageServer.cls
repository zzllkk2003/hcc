///
///Author: Jeff Liu
///Date: 2021-07-13 15:14:20
///LastEditTime: 2021-07-13 17:44:32
///LastEditors: Jeff Liu
///Description: 
///FilePath: /hcc/src/HCC/SVR/Prod/BS/HIPMessageServer.cls
///Jeff.liu@intersytems.com
///
/// 互联互通交互服务接口
Class HCC.SVR.Prod.BS.HIPMessageServer Extends EnsLib.SOAP.Service
{

/// 暂时没有使用，防止报错，暂不删除
Parameter ADAPTER;

Parameter SERVICENAME = "JiaoHuService";

/// WebService 的名称.
/// WebService 的 SOAP Namespace
Parameter NAMESPACE = "urn:hl7-org:v3";

/// 引用类的 命名空间 将在 WSDL 中使用.
Parameter USECLASSNAMESPACES = 1;

/// <summary>
/// 交互服务统一接口 
/// </summary>
/// <param name="action">服务代码 exg:PatientInfoRegister,PatientInfoUpdate....</param>
/// <param name="message">消息数据流</param>%Stream.GlobalCharacter
/// <returns></returns>
Method HIPMessageServer(action As %String, message As %Stream.GlobalCharacter) As %Stream.GlobalCharacter [ WebMethod ]
{
	Set tRequest = ##class(HCC.SVR.Prod.MSG.SVRRequest).%New()
	Set tRequest.Action	= action
	Set tRequest.Message = message
	Set tResponse =##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
	Set msgId=""
	//set tRequest.DocType="PRPA_IN201311UV02"
	set tRequest.DocType= ..GetDocType(message,.msgId)
	if (tRequest.DocType="<errorNoRootElement>")||(tRequest.DocType="")||(msgId="Error") {
		Set tResponse= ##class(HCC.Utils.ResponseHelper).ReturnError("您传递的消息，不符合标准交互消息，请自行查看文档中是否有异常编码。")
	} else {
		Set tRequest.MsgId=msgId
		Set tStatus = ..SendRequestSync("HCC.SVR.Prod.BP.MainControl", tRequest,.tResponse)
		//Set tResponse= ##class(HCC.Utils.ResponseHelper).ReturnError("平台接收到消息后的解析异常。")
	}
	Quit tResponse.Message
}

/// 获取文档类型
ClassMethod GetDocType(pXML As %Stream.GlobalCharacter, Output msgId As %String) As %String
{
   	set tRoot=""
    try{
 	Set tStatus = ##class(%XML.XPATH.Document).CreateFromStream(pXML, .tDocument)
	Set tStatus = tDocument.EvaluateExpression("/*", "name()", .tResults)
	
	Set tStatus = pXML.Rewind()
	If (tResults.Count() > 0) Set tRoot = tResults.GetAt(1).Value
	Else  Set tRoot = "<errorNoRootElement>"
	
	Set msgId=""
	set tDocument.PrefixMappings="s urn:hl7-org:v3"     
	Set tStatus = tDocument.EvaluateExpression("/s:"_tRoot_"/s:id", "@extension", .tResults)
	If (tResults.Count() > 0) Set msgId = tResults.GetAt(1).Value
	Else  Set msgId = ""
    }
    catch exp{
	   Set msgId = "Error"
	    }
	quit tRoot
}

}
