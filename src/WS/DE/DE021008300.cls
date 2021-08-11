Class WS.DE.DE021008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康史";

Parameter Description = "月经持续时间(d)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE021008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008300State</State>
<StreamLocation>^WS.DE.DE021008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
