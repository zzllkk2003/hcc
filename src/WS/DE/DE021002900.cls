Class WS.DE.DE021002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "观察项目代码值";

Parameter Format = "AN..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE021002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002900State</State>
<StreamLocation>^WS.DE.DE021002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
