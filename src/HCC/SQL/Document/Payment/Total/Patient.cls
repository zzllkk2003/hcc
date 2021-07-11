/// 费用章节
/// 住院总费用-自付金额
Class HCC.SQL.Document.Payment.Total.Patient Extends (%SerialObject, %XML.Adaptor)
{

/// 住院总费用-自付金额
Property patient As WS.DE.DE070001000 [ SqlFieldName = patient ];

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>patientPay</Value>
</Value>
<Value name="2">
<Value>patient</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^HCC.SQL.Document.P22AB.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
