Class WS.DE.DE060010100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输精管结扎手术方式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:直视钳穿法;2:传统方法;9:其他";

Parameter ValueSet = "DE06.00.101.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.101.00");

Storage Default
{
<Data name="DE060010100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010100State</State>
<StreamLocation>^WS.DE.DE060010100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
