Class WS.DE.DE021006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "生育子数";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE021006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006000State</State>
<StreamLocation>^WS.DE.DE021006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
