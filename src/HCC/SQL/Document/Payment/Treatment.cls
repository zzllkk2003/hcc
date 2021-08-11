/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 费用章节
/// 治疗费
Class HCC.SQL.Document.Payment.Treatment Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗-非手术治疗项目费
Property nonSurgery As HCC.SQL.Document.Payment.NonSurgery [ SqlFieldName = nonsurg ];

/// 治疗-手术治疗费
Property Surgery As HCC.SQL.Document.Payment.Surgery [ SqlFieldName = surg ];

Storage Default
{
<Data name="TreatmentState">
<Value name="1">
<Value>nonSurgery</Value>
</Value>
<Value name="2">
<Value>Surgery</Value>
</Value>
</Data>
<State>TreatmentState</State>
<StreamLocation>^HCC.SQL.Document7798.TreatmentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
