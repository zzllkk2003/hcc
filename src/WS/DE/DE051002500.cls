Class WS.DE.DE051002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Parameter Category = "医学评估";

Parameter Description = "复发次数(次)";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE051002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002500State</State>
<StreamLocation>^WS.DE.DE051002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
