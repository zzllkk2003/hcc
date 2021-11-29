Class WS.DE.DE045014900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血氧饱和度（%）";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9999.9, MINVAL = 100, SCALE = 1);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
