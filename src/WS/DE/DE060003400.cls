Class WS.DE.DE060003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "宫内节育器取出异常情况描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003400State</State>
<StreamLocation>^WS.DE.DE060003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
