Class WS.DE.DE085000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "监测设备金额分类代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:1千元及以上且小于1万元;2:1万元及以上且小于10万元;3:10万元及以上;";

Parameter ValueSet = "DE08.50.002.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.50.002.00");

Storage Default
{
<Data name="DE085000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000200State</State>
<StreamLocation>^WS.DE.DE085000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
