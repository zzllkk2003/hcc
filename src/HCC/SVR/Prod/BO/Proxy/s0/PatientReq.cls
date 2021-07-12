/// Created from: http://10.211.55.13:52774/csp/healthshare/mocksys/EMR.WS.PatientService.cls?wsdl
Class HCC.SVR.Prod.BO.Proxy.s0.PatientReq Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "urn:hl7-org:v3";

Parameter XMLNAME = "PatientReq";

Parameter XMLSEQUENCE = 1;

Property Message As %String(MAXLEN = "", XMLNAME = "Message");

Property Action As %String(MAXLEN = "", XMLNAME = "Action");

Storage Default
{
<Data name="PatientReqState">
<Value name="1">
<Value>Message</Value>
</Value>
<Value name="2">
<Value>Action</Value>
</Value>
</Data>
<State>PatientReqState</State>
<StreamLocation>^HCC.SVR.Prod.BO740B.PatientReqS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
