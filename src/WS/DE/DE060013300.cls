Class WS.DE.DE060013300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物使用频率";

Parameter WSDT = "S3";

Parameter Format = "AN2";

Parameter ValueSet = "CV06.00.228";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.228");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
