Class WS.DE.DE030009400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "职业防护措施标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030009400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009400State</State>
<StreamLocation>^WS.DE.DE030009400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
