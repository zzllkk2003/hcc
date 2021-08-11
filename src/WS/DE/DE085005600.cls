Class WS.DE.DE085005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "处方药品组号";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
