Class WS.DE.DE021004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "流产总次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004900State</State>
<StreamLocation>^WS.DE.DE021004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
