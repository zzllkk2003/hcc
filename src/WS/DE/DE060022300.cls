Class WS.DE.DE060022300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "离院方式";

Parameter Format = "N1";

/// Parameter ValueSet = "1:医嘱离院;2:医嘱转院;3:医嘱转社区卫生服务机构/乡镇卫生院;4:非医嘱离院;5:死亡;9:其他;";
Parameter ValueSet = "DE06.00.223.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.223.00");

Storage Default
{
<Data name="DE060022300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060022300State</State>
<StreamLocation>^WS.DE.DE060022300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
