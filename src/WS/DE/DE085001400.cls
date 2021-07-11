Class WS.DE.DE085001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "乙肝疫苗种类";

Parameter Format = "N1";

Parameter ValueSet = "1:重组酵母乙肝疫苗;2:中国仓鼠卵细胞乙肝疫苗;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.50.014.00");

Storage Default
{
<Data name="DE085001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001400State</State>
<StreamLocation>^WS.DE.DE085001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
