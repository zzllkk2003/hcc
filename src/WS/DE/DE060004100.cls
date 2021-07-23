Class WS.DE.DE060004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "婚检咨询指导结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:接受;2:不接受";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.041.00");

Storage Default
{
<Data name="DE060004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004100State</State>
<StreamLocation>^WS.DE.DE060004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
