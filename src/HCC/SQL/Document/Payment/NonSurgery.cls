/// 费用章节
/// 治疗费 - 非手术治疗项目费
Class HCC.SQL.Document.Payment.NonSurgery Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗-非手术治疗项目费
Property nonSurgery As WS.HSDE.HDSD0011129 [ SqlFieldName = nonsurg ];

/// 治疗-非手术治疗项目费-临床物理治疗费
Property physical As HCC.SQL.Document.Payment.NonSurgery.Physical [ SqlFieldName = phy ];

Storage Default
{
<Data name="NonSurgeryState">
<Value name="1">
<Value>nonSurgery</Value>
</Value>
<Value name="2">
<Value>treatmentPhysical</Value>
</Value>
<Value name="3">
<Value>physical</Value>
</Value>
</Data>
<State>NonSurgeryState</State>
<StreamLocation>^HCC.SQL.Documen7798.NonSurgeryS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
