/// 费用章节
/// 综合医疗服务费
Class HCC.SQL.Document.Payment.General Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 综合医疗服务费-一般医疗服务费
Property service As WS.HSDE.HDSD0011147 [ SqlFieldName = serv ];

/// 综合医疗服务费-一般治疗操作费
Property treatment As WS.HSDE.HDSD0011148 [ SqlFieldName = treat ];

/// 综合医疗服务费-护理费
Property nurse As WS.HSDE.HDSD0011145 [ SqlFieldName = nurse ];

/// 综合医疗服务费-其他费用
Property other As WS.HSDE.HDSD0011146 [ SqlFieldName = other ];

Storage Default
{
<Data name="GeneralState">
<Value name="1">
<Value>generalService</Value>
</Value>
<Value name="2">
<Value>generalTreatment</Value>
</Value>
<Value name="3">
<Value>generalNurse</Value>
</Value>
<Value name="4">
<Value>generalOther</Value>
</Value>
<Value name="5">
<Value>service</Value>
</Value>
<Value name="6">
<Value>treatment</Value>
</Value>
<Value name="7">
<Value>nurse</Value>
</Value>
<Value name="8">
<Value>other</Value>
</Value>
</Data>
<State>GeneralState</State>
<StreamLocation>^HCC.SQL.Document.P7798.GeneralS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
