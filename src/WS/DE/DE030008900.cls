Class WS.DE.DE030008900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "职业暴露史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030008900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008900State</State>
<StreamLocation>^WS.DE.DE030008900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
