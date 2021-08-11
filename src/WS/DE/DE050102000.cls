Class WS.DE.DE050102000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.031");

Parameter Category = "医学诊断";

Parameter Description = "肝衰竭分类";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.031";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050102000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102000State</State>
<StreamLocation>^WS.DE.DE050102000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
