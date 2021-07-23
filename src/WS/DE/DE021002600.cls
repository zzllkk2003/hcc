Class WS.DE.DE021002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "疾病史(含外伤)";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE021002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002600State</State>
<StreamLocation>^WS.DE.DE021002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
