/// 返回消息处理后的通用响应
Class HCC.Utils.ResponseHelper Extends %RegisteredObject
{

/// 【1.1】返回消息处理成功
ClassMethod ReturnSuccessMsg(targetMessageId As %String, content As %String, senderItem As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,content,senderItem,1)
}

/// 【1.2】返回消息处理成功，内容默认为【交互消息处理成功。】
ClassMethod ReturnSuccessMsgNoContent(targetMessageId As %String, senderItem As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,"交互消息处理成功。",senderItem,1)
}

/// 【1.3】返回消息处理成功，内容默认为【交互消息处理成功。】
ClassMethod ReturnSuccessMsgNoContentAndSenderInfo(targetMessageId As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,"交互消息处理成功。","",1)
}

/// 【1.4】返回消息处理成功，没有发送方代码
ClassMethod ReturnSuccessMsgNoSenderInfo(targetMessageId As %String, content As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,content,"",1)
}

/// 【1.5】返回消息处理成功
ClassMethod ReturnSuccess() As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm("","交互消息处理成功。","",1)
}

/// 【2.1】返回消息处理失败
ClassMethod ReturnErrorMsg(targetMessageId As %String, content As %String, senderItem As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,content,senderItem)
}

/// 【2.2】返回消息处理失败，内容默认为【系统异常，处理失败。】
ClassMethod ReturnErrorMsgNoContent(targetMessageId As %String, senderItem As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,"系统异常，处理失败。",senderItem)
}

/// 【2.3】返回消息处理失败，内容默认为【系统异常，处理失败。】
ClassMethod ReturnErrorMsgNoContentAndSenderInfo(targetMessageId As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,"系统异常，处理失败。","")
}

/// 【2.4】返回消息处理失败，没有发送方代码
ClassMethod ReturnErrorMsgNoSenderInfo(targetMessageId As %String, content As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm(targetMessageId,content,"")
}

/// 【2.5】返回消息处理失败
ClassMethod ReturnError(content As %String) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	quit ..SetResultComm("",content,"")
}

/// 处理通用的成功或异常消息方法 1）targetMessageId ：请求消息ID。2）content：消息处理结果内容。3）senderItem：发送方的代码标识。4）result：默认0为失败。1为成功
ClassMethod SetResultComm(targetMessageId As %String, content As %String, senderItem As %String, result As %Boolean = 0) As HCC.SVR.Prod.MSG.SVRResponse [ Language = objectscript ]
{
	//senderItem：发送方的代码标识
	//targetMessageId ：请求消息ID 
	
	//处理结果  AE：表示失败。AA：表示成功。
	Set typeCode="AE"
	set:(result = 1) typeCode = "AA"
	//消息ID，系统自动生成
	Set guid="1234-3124-43-1234"
	//消息创建时间  exg:20170106151903
	Set creatTime="20170106151903"
	//返回处理通用标准消息
	Set msg="<MCCI_IN000002UV01 ITSVersion=""XML_1.0"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns=""urn:hl7-org:v3"" xsi:schemaLocation=""urn:hl7-org:v3 ../multicacheschemas/MCCI_IN000002UV01.xsd""><id root=""2.16.156.10011.2.5.1.1"" extension="""_guid_"""/><creationTime value="""_creatTime_"""/><interactionId root=""2.16.156.10011.2.5.1.2"" extension=""MCCI_IN000002UV01""/><processingCode code=""P""/><processingModeCode/><acceptAckCode code=""AL""/><receiver typeCode=""RCV""><device classCode=""DEV"" determinerCode=""INSTANCE""><id><item root=""2.16.156.10011.2.5.1.3"" extension="""_senderItem_"""/></id></device></receiver><sender typeCode=""SND""><device classCode=""DEV"" determinerCode=""INSTANCE""><id><item root=""2.16.156.10011.2.5.1.3"" extension=""TRIP""/></id></device></sender><acknowledgement typeCode="""_typeCode_"""><targetMessage><id root=""2.16.156.10011.2.5.1.1"" extension="""_targetMessageId_"""/></targetMessage><acknowledgementDetail><text value="""_content_"""/></acknowledgementDetail></acknowledgement></MCCI_IN000002UV01>"
	
	Set pResponse =##class(HCC.SVR.Prod.MSG.SVRResponse).%New()
	Set pResponse.Result=result
	Set msgChar=##class(%Stream.GlobalCharacter).%New()
	do msgChar.Write(msg)
	do msgChar.Rewind()
	Set pResponse.Message=msgChar
	quit pResponse
}

}
