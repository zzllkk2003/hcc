Class WS.DE.DE021007900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "乙肝疫苗接种标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021007900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007900State</State>
<StreamLocation>^WS.DE.DE021007900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
