Class WS.DE.DE060028900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "医嘱项目类型";

Parameter WSDT = "S3";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.229";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.229");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
