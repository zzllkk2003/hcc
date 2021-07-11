Class WS.DE.DE051010800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "早孕反应开始孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE051010800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010800State</State>
<StreamLocation>^WS.DE.DE051010800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
