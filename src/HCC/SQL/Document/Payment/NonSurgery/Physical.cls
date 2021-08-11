/// 费用章节
/// 治疗费 - 非手术治疗项目费-临床物理治疗费
Class HCC.SQL.Document.Payment.NonSurgery.Physical Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗-非手术治疗项目费-临床物理治疗费
Property Amount As WS.HSDE.HDSD0011130 [ SqlFieldName = amount ];

Storage Default
{
<Data name="PhysicalState">
<Value name="1">
<Value>Amount</Value>
</Value>
</Data>
<State>PhysicalState</State>
<StreamLocation>^HCC.SQL.Document8E4C.PhysicalS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
