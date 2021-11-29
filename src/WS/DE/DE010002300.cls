/// 血袋编码
Class WS.DE.DE010002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "血袋编码";

Parameter Format = "N10";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(PATTERN = "10N");

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
