/// EMR.WS.PatientService
Class EMR.WS.PatientService Extends EnsLib.SOAP.Service [ ProcedureBlock ]
{

/// 暂时没有使用，防止报错，暂不删除
Parameter ADAPTER;

Parameter SERVICENAME = "JiaoHuService";

/// WebService 的名称.
/// WebService 的 SOAP Namespace
Parameter NAMESPACE = "urn:hl7-org:v3";

/// 引用类的 命名空间 将在 WSDL 中使用.
Parameter USECLASSNAMESPACES = 1;

// Method QueryPatient(pid As %String) As EMR.MSG.PatientResp [ WebMethod ]

// {

// set patInst = ##class(EMR.Patient).%OpenId(pid)

// set patMsg = ..GetPatientMsg(patInst)

// Quit patMsg

// }

/// QueryPatient
/// AddPatient
Method PatRegister(pat As EMR.MSG.PatientReq) As %Stream.GlobalCharacter [ WebMethod ]
{
	//#dim patInst As EMR.Patient 
	//set patInst=""
	Set action =pat.Action
	#Dim patMsg as EMR.MSG.PatientResp
	//set patS =##class(HS.Util.StreamUtils).EnsureStream(pat)
	set tSc= ..GetRegisterPatientInfo(pat.Message,.patInst)
	If $$$ISERR(tSc){Quit ##class(EMR.Tools.Utils).ReturnErrorMsg("123",tSc,"")}
	Set tSc = patInst.%Save()
	If $$$ISERR(tSc){Quit ##class(EMR.Tools.Utils).ReturnErrorMsg("123","病人已存在，注册新病人失败"_tSc,"")}
	Set patMsg= ##class(EMR.Tools.Utils).ReturnSuccessMsgNoContent("123","注册成功")
	$$$LOGINFO(patMsg)
	Quit patMsg.Message
}

/// 解析病人注册消息
ClassMethod GetRegisterPatientInfo(msg As %Stream.GlobalCharacter, ByRef pat As EMR.Patient) As %Status
{
	
	#DIM vDoc AS EnsLib.EDI.XML.Document = ##class(EnsLib.EDI.XML.Document).ImportFromLibraryStream(msg)
	//#DIM vDoc AS EnsLib.EDI.XML.Document = ##class(EnsLib.EDI.XML.Document).ImportFromFile("/home/UCR/V3SCHEMA/msg/1.xml")

	set vDoc.DocType="PRPA_IN201311UV02:PRPA_IN201311UV02"
    Set pat = ##class(EMR.Patient).%New()
	Set pat.IDCard  =vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/id[1]/item[1]/@extension")

  Set pat.PatNo =vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/id[1]/item[1]/@extension")

  Set pat.Name =vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/name[1]/item[1]/part[1]/@value")

  Set pat.Gender= vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/administrativeGenderCode[1]/@code")

  Set pat.DOB =vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/birthTime[1]/@value")

  Set pat.Citizenship =vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/ethnicGroupCode[1]/item[1]/@code")

  Set pat.PhoneNumber = vDoc.GetValueAt("/PRPA_IN201311UV02/controlActProcess[1]/subject[1]/registrationRequest[1]/subject1[1]/patient[1]/patientPerson[1]/telecom[1]/item[1]/@value")
  
  set tsc = pat.%ValidateObject()
  Quit tsc
}

}
