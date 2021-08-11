/// 治疗计划章节 - 输血过程
Class HCC.SQL.Document.TreatmentPlan.BloodTransfusion Extends (%SerialObject, %XML.Adaptor)
{

/// 输血时间
Property time As WS.DE.DE060022100 [ SqlFieldName = time ];

/// 输血方式
Property way As WS.DE.DE060026600 [ SqlFieldName = way ];

/// 输血指征
Property indication As WS.DE.DE060034000 [ SqlFieldName = indic ];

/// 输血品种代码
Property type As WS.DE.DE085004000 [ SqlFieldName = type ];

/// 输血前有关检查项目以及结果
Property testResult As WS.DE.DE051010900 [ SqlFieldName = test_result ];

Storage Default
{
<Data name="BloodTransfusionState">
<Value name="1">
<Value>time</Value>
</Value>
<Value name="2">
<Value>way</Value>
</Value>
<Value name="3">
<Value>indication</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>testResult</Value>
</Value>
</Data>
<State>BloodTransfusionState</State>
<StreamLocation>^HCC.SQL.Do63C8.BloodTransf9B62S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
