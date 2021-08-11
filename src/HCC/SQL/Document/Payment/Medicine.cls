/// 费用章节
/// 西药费
Class HCC.SQL.Document.Payment.Medicine Extends (%SerialObject, %XML.Adaptor)
{

/// 西药费 - 费用
Property medicine As WS.HSDE.HDSD0011098 [ SqlFieldName = med ];

/// 西药费 - 抗菌药物费用
Property antibacterial As WS.HSDE.HDSD0011099 [ SqlFieldName = antibac ];

Storage Default
{
<Data name="MedicineState">
<Value name="1">
<Value>medicine</Value>
</Value>
<Value name="2">
<Value>antibacterial</Value>
</Value>
</Data>
<State>MedicineState</State>
<StreamLocation>^HCC.SQL.Document7798.MedicineS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
