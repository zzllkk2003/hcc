Class WS.DE.DE040104400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "末次月经日期明确标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040104400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104400State</State>
<StreamLocation>^WS.DE.DE040104400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
