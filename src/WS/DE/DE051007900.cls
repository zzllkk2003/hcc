Class WS.DE.DE051007900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "下肢淋巴水肿/象皮胂分期";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE051007900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007900State</State>
<StreamLocation>^WS.DE.DE051007900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
