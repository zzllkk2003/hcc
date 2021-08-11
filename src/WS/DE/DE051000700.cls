Class WS.DE.DE051000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "产后42天检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000700State</State>
<StreamLocation>^WS.DE.DE051000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
