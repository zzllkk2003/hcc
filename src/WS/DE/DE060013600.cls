Class WS.DE.DE060013600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物用法";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060013600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013600State</State>
<StreamLocation>^WS.DE.DE060013600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
