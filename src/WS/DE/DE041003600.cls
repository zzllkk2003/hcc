Class WS.DE.DE041003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肺部异常呼吸音描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003600State</State>
<StreamLocation>^WS.DE.DE041003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
