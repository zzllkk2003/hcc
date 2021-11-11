Class WS.DE.DE060021500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "Apgar评分间隔时间代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:1min;2:5min;3:10min;";

Parameter ValueSet = "DE06.00.215.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.215.00");

Storage Default
{
<Data name="DE060021500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060021500State</State>
<StreamLocation>^WS.DE.DE060021500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
