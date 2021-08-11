Class WS.DE.DE060013000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "药物不良反应描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060013000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013000State</State>
<StreamLocation>^WS.DE.DE060013000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}