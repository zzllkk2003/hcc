Class WS.DE.DE060020800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "呼吸类型代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:自主呼吸;2:辅助呼吸;3:控制呼吸;";

Parameter ValueSet = "DE06.00.208.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.208.00");

Storage Default
{
<Data name="DE060020800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060020800State</State>
<StreamLocation>^WS.DE.DE060020800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
