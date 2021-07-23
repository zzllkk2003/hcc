/// 费用章节
/// 西药费 - 抗菌药物费用
Class HCC.SQL.Document.Payment.Medicine.Antibacterial Extends (%SerialObject, %XML.Adaptor)
{

/// 西药费 - 抗菌药物费用
Property antibacterial As WS.DE.DE070001000 [ SqlFieldName = antibacterial ];

Storage Default
{
<Data name="AntibacterialState">
<Value name="1">
<Value>antibacterial</Value>
</Value>
</Data>
<State>AntibacterialState</State>
<StreamLocation>^HCC.SQL.Docu34DE.AntibacterialS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
