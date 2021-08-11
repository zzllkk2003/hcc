Class WS.DE.DE060004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "检查开始日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004900State</State>
<StreamLocation>^WS.DE.DE060004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
