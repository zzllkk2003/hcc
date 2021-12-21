Class WS.DE.DE041018300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "胎心率（次/min）";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE041018300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041018300State</State>
<StreamLocation>^WS.DE.DE041018300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
