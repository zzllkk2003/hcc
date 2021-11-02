Class WS.DE.DE085004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "输血品种代码";

Parameter Format = "N..2";

Parameter WSDT = "S3";

Parameter ValueSet = "CV04.50.021";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.021");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
