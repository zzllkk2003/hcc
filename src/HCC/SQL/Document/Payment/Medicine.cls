/// 费用章节
/// 西药费
Class HCC.SQL.Document.Payment.Medicine Extends (%SerialObject, %XML.Adaptor)
{

/// 西药费
Property medicine As WS.DE.DE070001000 [ SqlFieldName = medicine ];

// Property medicineAntibacterial As WS.DE.DE070001000 [ SqlFieldName = antibacterial ];

/// 西药费 - 抗菌药物费用
Property antibacterialFee As HCC.SQL.Document.Payment.Medicine.Antibacterial;

Storage Default
{
<Data name="MedicineState">
<Value name="1">
<Value>Medicine</Value>
</Value>
<Value name="2">
<Value>MedicineAntibacterial</Value>
</Value>
<Value name="3">
<Value>medicine</Value>
</Value>
<Value name="4">
<Value>medicineAntibacterial</Value>
</Value>
<Value name="5">
<Value>antibacterial</Value>
</Value>
<Value name="6">
<Value>antibacterialFee</Value>
</Value>
</Data>
<State>MedicineState</State>
<StreamLocation>^HCC.SQL.Document7798.MedicineS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
