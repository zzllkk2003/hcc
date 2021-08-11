Class WS.DE.DE083002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.30.002");

Parameter Category = "卫生人员";

Parameter Description = "职工类别代码";

Parameter Format = "N4";

Parameter ValueSet = "CV08.30.002";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE083002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002600State</State>
<StreamLocation>^WS.DE.DE083002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
