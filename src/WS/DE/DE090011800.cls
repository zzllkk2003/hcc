Class WS.DE.DE090011800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "知情同意书编号标识";

Parameter Format = "AN..18";

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
