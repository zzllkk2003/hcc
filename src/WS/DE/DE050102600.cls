Class WS.DE.DE050102600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "结核病合并症代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.018";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.018");

Storage Default
{
<Data name="DE050102600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102600State</State>
<StreamLocation>^WS.DE.DE050102600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
