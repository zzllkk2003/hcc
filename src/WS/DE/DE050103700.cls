Class WS.DE.DE050103700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "伤害性质代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.004";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.004");

Storage Default
{
<Data name="DE050103700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103700State</State>
<StreamLocation>^WS.DE.DE050103700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
