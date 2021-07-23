Class WS.DE.DE060000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "本次就诊日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000400State</State>
<StreamLocation>^WS.DE.DE060000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
