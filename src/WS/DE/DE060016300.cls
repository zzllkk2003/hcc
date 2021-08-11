Class WS.DE.DE060016300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "治疗终止日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060016300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016300State</State>
<StreamLocation>^WS.DE.DE060016300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
