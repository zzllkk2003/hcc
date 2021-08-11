/// 宫口情况
Class WS.DE.DE041026500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "宫口情况";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
