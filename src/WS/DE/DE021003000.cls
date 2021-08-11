Class WS.DE.DE021003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "编码体系名称";

Parameter Format = "A..60";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 60, MINLEN = 0);

Storage Default
{
<Data name="DE021003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003000State</State>
<StreamLocation>^WS.DE.DE021003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
