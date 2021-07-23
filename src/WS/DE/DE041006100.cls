Class WS.DE.DE041006100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肝脏斜径测量值(cm)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE041006100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041006100State</State>
<StreamLocation>^WS.DE.DE041006100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
