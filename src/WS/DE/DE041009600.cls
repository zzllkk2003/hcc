Class WS.DE.DE041009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "建档孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009600State</State>
<StreamLocation>^WS.DE.DE041009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
