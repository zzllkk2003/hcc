Class WS.DE.DE041013200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "皮下出血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041013200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013200State</State>
<StreamLocation>^WS.DE.DE041013200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
