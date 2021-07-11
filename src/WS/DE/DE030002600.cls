Class WS.DE.DE030002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "接触二手烟天数(d)";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE030002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002600State</State>
<StreamLocation>^WS.DE.DE030002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
