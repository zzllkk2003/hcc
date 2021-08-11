/// 手术中可能出现的意外及风险
Class WS.DE.DE0510162001 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "手术中可能出现的意外及风险";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
