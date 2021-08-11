/// 费用章节
/// 住院总费用-自付金额
Class HCC.SQL.Document.Payment.Total.Patient Extends (%SerialObject, %XML.Adaptor)
{

/// 住院总费用-自付金额
Property Amount As WS.HSDE.HDSD0011143 [ SqlFieldName = amount ];

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>patientPay</Value>
</Value>
<Value name="2">
<Value>patient</Value>
</Value>
<Value name="3">
<Value>Amount</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^HCC.SQL.Document.P22AB.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
