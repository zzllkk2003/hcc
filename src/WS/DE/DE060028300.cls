Class WS.DE.DE060028300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "心理护理代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:根据病人心理状况施行心理护理;2:家属心理支持;";

Parameter ValueSet = "DE06.00.283.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.283.00");

Storage Default
{
<Data name="DE060028300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028300State</State>
<StreamLocation>^WS.DE.DE060028300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
