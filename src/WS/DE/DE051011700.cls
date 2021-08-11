Class WS.DE.DE051011700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "肿瘤患者转移部位";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051011700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011700State</State>
<StreamLocation>^WS.DE.DE051011700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
