/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 费用章节
/// 治疗费
Class HCC.SQL.Document.Payment.Treatment Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗-非手术治疗项目费
Property nonSurgeryFee As HCC.SQL.Document.Payment.NonSurgery;

/// 治疗-手术治疗费
Property SurgeryFee As HCC.SQL.Document.Payment.Surgery;

Storage Default
{
<Data name="TreatmentState">
<Value name="1">
<Value>treatmentNonSurgery</Value>
</Value>
<Value name="2">
<Value>treatmentPhysical</Value>
</Value>
<Value name="3">
<Value>treatmentSurgery</Value>
</Value>
<Value name="4">
<Value>treatmentAnesthesia</Value>
</Value>
<Value name="5">
<Value>treatmentSurgeryOperation</Value>
</Value>
<Value name="6">
<Value>nonSurgery</Value>
</Value>
<Value name="7">
<Value>Surgery</Value>
</Value>
<Value name="8">
<Value>nonSurgeryFee</Value>
</Value>
<Value name="9">
<Value>SurgeryFee</Value>
</Value>
</Data>
<State>TreatmentState</State>
<StreamLocation>^HCC.SQL.Document7798.TreatmentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
