Class WS.DE.DE050100400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "产前诊断孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE050100400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100400State</State>
<StreamLocation>^WS.DE.DE050100400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
