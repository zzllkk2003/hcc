Class WS.DE.DE040105900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "伤害发生地点代码";

Parameter Format = "N2";

Parameter ValueSet = "CV04.01.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.005");

Storage Default
{
<Data name="DE040105900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105900State</State>
<StreamLocation>^WS.DE.DE040105900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
