Class WS.DE.DE041009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "基础舒张压(mmHg)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009100State</State>
<StreamLocation>^WS.DE.DE041009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
