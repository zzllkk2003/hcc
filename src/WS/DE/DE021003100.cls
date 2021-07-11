Class WS.DE.DE021003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "观察项目名称";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE021003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003100State</State>
<StreamLocation>^WS.DE.DE021003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
