/// 
/// Author: Jeff Liu
/// Date: 2021-08-11 13:30:11
/// LastEditTime: 2021-08-13 17:04:17
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Utils/SchemaValidate.cls
/// Jeff.liu@intersytems.com
/// 
/// xml schema验证方法
Class HCC.Utils.SchemaValidate Extends %RegisteredObject
{

/// 验证xml schema
ClassMethod Validate(Msg As %Stream.GlobalCharacter, ByRef Errors) As %Status
{
   
  set ErrMsg =""
 Set tSchema="urn:hl7-org:v3 /home/UCR/V3SCHEMA/cda/CDA.xsd"	
 Set tSC=##class(%XML.TextReader).ParseStream(Msg,.tReader,,,,tSchema)
 set verifyResult=0	
 set errCount=0
 If $$$ISERR(tSC) Quit		
 While (tReader.Read()) 	
  {		
	if (tReader.NodeType="error") 		
	{		set errCount= errCount+1
		set ErrMsg= ErrMsg_"*ERROR* "_tReader.Value_$char(10)_tReader.Path_$char(10)		
	}	
  }	
  if (errCount=0)
  {
  set verifyResult=1
  }
  set Errors=ErrMsg
  quit verifyResult
}

ClassMethod GetDocType(pXML As %Stream.GlobalCharacter) As %String
{
   	set tRoot=""
 	Set tStatus = ##class(%XML.XPATH.Document).CreateFromStream(pXML, .tDocument)
	Set tStatus = tDocument.EvaluateExpression("/*", "name()", .tResults)
	
	Set tStatus = pXML.Rewind()
	If (tResults.Count() > 0) Set tRoot = tResults.GetAt(1).Value
	Else  Set tRoot = "<errorNoRootElement>"
	
	quit tRoot
}

}
