Class WS.DE.DE060021100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "护理等级";

Parameter Format = "N1";

Parameter ValueSet = "1:特级护理;2:一级护理;3:二级护理;4:三级护理;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.211.00");

Storage Default
{
<Data name="DE060021100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060021100State</State>
<StreamLocation>^WS.DE.DE060021100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
