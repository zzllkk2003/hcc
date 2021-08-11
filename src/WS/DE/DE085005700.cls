/// 皮肤消毒描述
Class WS.DE.DE085005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "皮肤消毒描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
