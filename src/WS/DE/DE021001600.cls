Class WS.DE.DE021001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "腹水日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE021001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001600State</State>
<StreamLocation>^WS.DE.DE021001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
