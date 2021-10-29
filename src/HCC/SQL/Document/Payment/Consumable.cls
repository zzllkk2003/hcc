/// 费用章节
/// 耗材费
Class HCC.SQL.Document.Payment.Consumable Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 耗材-一次性医用材料费-检查用 
Property exam As WS.HSDE.HDSD0011038 [ SqlFieldName = exam ];

/// 耗材-一次性医用材料费-治疗用 
Property treatment As WS.HSDE.HDSD0011040 [ SqlFieldName = treat ];

/// 耗材-一次性医用材料费-手术用 
Property surgery As WS.HSDE.HDSD0011039 [ SqlFieldName = surg ];

Storage Default
{
<Data name="ConsumableState">
<Value name="1">
<Value>exam</Value>
</Value>
<Value name="2">
<Value>treatment</Value>
</Value>
<Value name="3">
<Value>surgery</Value>
</Value>
</Data>
<State>ConsumableState</State>
<StreamLocation>^HCC.SQL.Documen7798.ConsumableS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
