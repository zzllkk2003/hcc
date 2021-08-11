Class WS.DE.DE021009900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "既往史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
