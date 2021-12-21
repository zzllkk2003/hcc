Class WS.DE.DE041024600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "产后检查时间（min）";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
