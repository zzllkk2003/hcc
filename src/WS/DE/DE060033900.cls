/// 入院途径代码
/// WS445-8定义
Class WS.DE.DE060033900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "入院途径代码";

Parameter Format = "N1";

Parameter ValueSetDisplay;

Parameter ValueSet = "CV09.00.403";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV09.00.403");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
