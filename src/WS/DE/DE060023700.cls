/// 入病房方式描述
/// WS445-8定义
Class WS.DE.DE060023700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "入病房方式描述";

Parameter Format = "AN..20";

Parameter ValueSetDisplay;

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20);

Storage Default
{
<Data name="DE060023700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023700State</State>
<StreamLocation>^WS.DE.DE060023700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
