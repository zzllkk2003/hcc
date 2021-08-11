/// 费用章节
/// 住院总费用
Class HCC.SQL.Document.Payment.Total Extends (%SerialObject, %XML.Adaptor)
{

/// 总费用
Property total As WS.HSDE.HDSD0011142 [ SqlFieldName = total ];

/// 自付金额
Property patientPay As HCC.SQL.Document.Payment.Total.Patient [ SqlFieldName = pp ];

Storage Default
{
<Data name="TotalState">
<Value name="1">
<Value>totalFee</Value>
</Value>
<Value name="2">
<Value>patientPay</Value>
</Value>
<Value name="3">
<Value>total</Value>
</Value>
</Data>
<State>TotalState</State>
<StreamLocation>^HCC.SQL.Document.Pay7798.TotalS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
