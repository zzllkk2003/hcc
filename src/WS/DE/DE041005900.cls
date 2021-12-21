Class WS.DE.DE041005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肝脏肋下测量值（cm）";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE041005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005900State</State>
<StreamLocation>^WS.DE.DE041005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
