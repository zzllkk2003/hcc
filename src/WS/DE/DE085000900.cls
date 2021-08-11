Class WS.DE.DE085000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "消毒剂加药方式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:机械加药;2:部分机械加药;3:人工加药;";

Parameter ValueSet = "DE08.50.009.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.50.009.00");

Storage Default
{
<Data name="DE085000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000900State</State>
<StreamLocation>^WS.DE.DE085000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
