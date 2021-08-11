Class WS.DE.DE021000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "出生孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE021000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021000600State</State>
<StreamLocation>^WS.DE.DE021000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
