/// 胎儿娩出方式
Class WS.DE.DE051017300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "胎儿娩出方式";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
