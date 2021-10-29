/// 卫生事件章节-自付金额
Class HCC.SQL.Document.HealthcareEvent.Fee Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 医疗保险类别
Property insuranceType As WS.DE.DE020104400 [ SqlFieldName = insur_type ];

/// 医疗费用支付方式
Property paymentType As WS.DE.DE070000700 [ SqlFieldName = pay_type ];

/// 门诊费用
Property outpatient As WS.DE.DE070000400 [ SqlFieldName = op ];

/// 住院费用
Property inpatient As WS.DE.DE070001000 [ SqlFieldName = ip ];

/// 个人承担费用
Property patientPay As WS.DE.DE070000100 [ SqlFieldName = pat_pay ];

Storage Default
{
<Data name="FeeState">
<Value name="1">
<Value>insuranceType</Value>
</Value>
<Value name="2">
<Value>paymentType</Value>
</Value>
<Value name="3">
<Value>outpatient</Value>
</Value>
<Value name="4">
<Value>inpatient</Value>
</Value>
<Value name="5">
<Value>patientPay</Value>
</Value>
</Data>
<State>FeeState</State>
<StreamLocation>^HCC.SQL.Document.Health2E2.FeeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
