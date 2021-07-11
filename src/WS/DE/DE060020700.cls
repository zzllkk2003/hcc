Class WS.DE.DE060020700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "呼吸机监护项目";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060020700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020700State</State>
<StreamLocation>^WS.DE.DE060020700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
