Class WS.DE.DE060018500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "患者去向";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "S3";

Property Value As %Integer(MAXVAL = 9, MINVAL = 0);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
