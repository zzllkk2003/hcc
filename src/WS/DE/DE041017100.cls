Class WS.DE.DE041017100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "视力下降标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041017100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017100State</State>
<StreamLocation>^WS.DE.DE041017100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
