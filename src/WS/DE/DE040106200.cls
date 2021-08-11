Class WS.DE.DE040106200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.003");

Parameter Category = "主诉与症状";

Parameter Description = "伤害发生原因代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.01.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040106200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106200State</State>
<StreamLocation>^WS.DE.DE040106200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
