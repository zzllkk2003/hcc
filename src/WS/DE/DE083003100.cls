Class WS.DE.DE083003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "专业技术职务类别代码";

Parameter Format = "N3";

Parameter ValueSet = "CVO8.30.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CVO8.30.005");

Storage Default
{
<Data name="DE083003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083003100State</State>
<StreamLocation>^WS.DE.DE083003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
