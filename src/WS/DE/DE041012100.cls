Class WS.DE.DE041012100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "爬行月龄(月 )";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041012100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012100State</State>
<StreamLocation>^WS.DE.DE041012100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
