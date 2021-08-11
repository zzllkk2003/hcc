Class WS.DE.DE041020600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "心律(次/min)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041020600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020600State</State>
<StreamLocation>^WS.DE.DE041020600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
