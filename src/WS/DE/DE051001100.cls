Class WS.DE.DE051001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "医学评估";

Parameter Description = "产前筛查孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE051001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001100State</State>
<StreamLocation>^WS.DE.DE051001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
