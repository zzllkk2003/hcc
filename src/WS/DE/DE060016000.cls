Class WS.DE.DE060016000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治疗开始日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060016000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016000State</State>
<StreamLocation>^WS.DE.DE060016000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
