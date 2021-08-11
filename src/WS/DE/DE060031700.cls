/// 手术准备事项描述
Class WS.DE.DE060031700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术准备事项描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
