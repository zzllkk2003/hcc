Class WS.DE.DE040106800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "首次出现症状日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE040106800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040106800State</State>
<StreamLocation>^WS.DE.DE040106800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
