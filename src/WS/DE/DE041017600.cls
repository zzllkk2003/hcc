Class WS.DE.DE041017600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "舒张压（mmHg）";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE041017600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017600State</State>
<StreamLocation>^WS.DE.DE041017600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
