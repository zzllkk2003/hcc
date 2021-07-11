Class WS.DE.DE050103800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "伤害诊断代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE050103800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103800State</State>
<StreamLocation>^WS.DE.DE050103800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
