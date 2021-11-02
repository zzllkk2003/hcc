Class WS.DE.DE045014900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血氧饱和度（%）";

Parameter Format = "N1..3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
