Class WS.DE.DE060013700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "药物治疗建议";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060013700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013700State</State>
<StreamLocation>^WS.DE.DE060013700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
