Class WS.DE.DE021002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "观察方法名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE021002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002700State</State>
<StreamLocation>^WS.DE.DE021002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}