Class WS.DE.DE051013801 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "颅脑损伤患者入院前昏迷时间(天)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE051013801State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051013801State</State>
<StreamLocation>^WS.DE.DE051013801S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
