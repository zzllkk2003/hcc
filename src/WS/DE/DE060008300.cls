Class WS.DE.DE060008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "皮下埋植剂埋植部位代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:左上臂;2:右上臂;9:其他";

Parameter ValueSet = "DE06.00.083.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.083.00");

Storage Default
{
<Data name="DE060008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008300State</State>
<StreamLocation>^WS.DE.DE060008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
