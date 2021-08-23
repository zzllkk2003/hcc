Class WS.DE.DE040111400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "症状/体征发作开始日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE040111400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111400State</State>
<StreamLocation>^WS.DE.DE040111400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
