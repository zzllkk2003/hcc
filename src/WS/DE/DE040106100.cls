Class WS.DE.DE040106100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "伤害发生时活动类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.006";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.006");

Storage Default
{
<Data name="DE040106100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106100State</State>
<StreamLocation>^WS.DE.DE040106100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
