Class WS.DE.DE041008200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "呼吸频率(次/min)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041008200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008200State</State>
<StreamLocation>^WS.DE.DE041008200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
