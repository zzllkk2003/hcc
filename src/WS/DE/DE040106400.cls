Class WS.DE.DE040106400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.004");

Parameter Category = "主诉与症状";

Parameter Description = "伤害意图类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.004";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040106400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106400State</State>
<StreamLocation>^WS.DE.DE040106400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
