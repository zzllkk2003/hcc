Class WS.DE.DE040100500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "出现症状日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE040100500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100500State</State>
<StreamLocation>^WS.DE.DE040100500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
