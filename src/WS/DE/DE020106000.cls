/// 患者就诊类型的分类代码，来自《WS 445-1 病历概要》
Class WS.DE.DE020106000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "患者类型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV09.00.404";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV09.00.404");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
