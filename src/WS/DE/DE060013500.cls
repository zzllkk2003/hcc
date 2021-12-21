Class WS.DE.DE060013500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物使用总剂量";

Parameter Format = "N..12,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999999999.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
