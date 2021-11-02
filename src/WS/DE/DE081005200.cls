Class WS.DE.DE081005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "组织机构代码";

Parameter Format = "AN10";

Parameter ValueSet = "WS.218.2002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "WS.218.2002");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
