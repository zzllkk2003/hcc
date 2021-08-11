/// 饮食指导代码
/// 源自WS 445-8
Class WS.DE.DE060029100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "饮食指导代码";

Parameter Format = "N2";

Parameter ValueSetDisplay;

Parameter ValueSet = "CV06.00.224";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.224");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
