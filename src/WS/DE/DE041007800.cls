Class WS.DE.DE041007800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "骨盆测量孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE041007800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041007800State</State>
<StreamLocation>^WS.DE.DE041007800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
