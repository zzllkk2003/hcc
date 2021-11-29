/// 该数据元实际表达医疗机构10位组织机构编码
Class WS.DE.DE081005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "组织机构代码";

Parameter Format = "AN10";

Parameter ValueSet = "WS.218.2002";

Parameter WSDT = "S3";

Property Value As %String(MAXLEN = 10, MINLEN = 10);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
