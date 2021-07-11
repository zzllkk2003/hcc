Class WS.DE.DE060030700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "麻醉中西医标识代码";

Parameter Format = "N1";

Parameter ValueSet = "1:西医麻醉;2:中医麻醉;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.307.00");

Storage Default
{
<Data name="DE060030700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030700State</State>
<StreamLocation>^WS.DE.DE060030700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
