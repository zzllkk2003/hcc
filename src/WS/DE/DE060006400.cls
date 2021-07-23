Class WS.DE.DE060006400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "疾病防控情况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:开展;2:部分开展;3:未开展";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.064.00");

Storage Default
{
<Data name="DE060006400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060006400State</State>
<StreamLocation>^WS.DE.DE060006400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
