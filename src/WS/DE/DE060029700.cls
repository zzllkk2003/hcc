Class WS.DE.DE060029700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "诊疗过程名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060029700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060029700State</State>
<StreamLocation>^WS.DE.DE060029700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
