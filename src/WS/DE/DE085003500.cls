/// 产品供应商
Class WS.DE.DE085003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "产品供应商";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
