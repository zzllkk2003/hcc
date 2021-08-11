/// 医嘱执行
Class HCC.SQL.Document.ProviderOrder.Item.Exec Extends (%SerialObject, %XML.Adaptor)
{

/// 医嘱执行日期时间
Property Time As WS.DE.DE060022200 [ SqlFieldName = time ];

/// 医嘱执行者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

/// 医嘱执行科室
Property Dept As WS.DE.DE081002600 [ SqlFieldName = dept ];

/// 医嘱执行状态
Property status As WS.DE.DE060029000 [ SqlFieldName = stat ];

Storage Default
{
<Data name="ExecState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
<Value name="3">
<Value>Dept</Value>
</Value>
<Value name="4">
<Value>status</Value>
</Value>
</Data>
<State>ExecState</State>
<StreamLocation>^HCC.SQL.Document.Prov34E7.ExecS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
