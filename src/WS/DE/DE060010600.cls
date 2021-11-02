Class WS.DE.DE060010600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血史标志";

Parameter WSDT = "S2";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:无;2:有;9:未说明;";

Parameter ValueSet = "DE06.00.106.00";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.106.00");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
