Class WS.DE.DE021006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "胎数";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE021006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006600State</State>
<StreamLocation>^WS.DE.DE021006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}