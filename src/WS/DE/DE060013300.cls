Class WS.DE.DE060013300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物使用频率";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE060013300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013300State</State>
<StreamLocation>^WS.DE.DE060013300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
