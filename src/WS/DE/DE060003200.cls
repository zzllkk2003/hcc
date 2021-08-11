Class WS.DE.DE060003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.104");

Parameter Category = "计划与干预";

Parameter Description = "宫内节育器放置时期代码";

Parameter Format = "N2";

Parameter ValueSet = "CV06.00.104";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003200State</State>
<StreamLocation>^WS.DE.DE060003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
