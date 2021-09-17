/// 费用章节
/// 治疗费 - 手术治疗项目费
Class HCC.SQL.Document.Payment.Surgery Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 治疗-手术治疗费
Property surgery As WS.HSDE.HDSD0011131 [ SqlFieldName = surg ];

/// 治疗-手术治疗费明细
Property detail As HCC.SQL.Document.Payment.Surgery.Detail;

Storage Default
{
<Data name="SurgeryState">
<Value name="1">
<Value>surgery</Value>
</Value>
<Value name="2">
<Value>detail</Value>
</Value>
</Data>
<State>SurgeryState</State>
<StreamLocation>^HCC.SQL.Document.P7798.SurgeryS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
