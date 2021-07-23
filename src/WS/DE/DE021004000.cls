Class WS.DE.DE021004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "家族近亲婚配";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004000State</State>
<StreamLocation>^WS.DE.DE021004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
