Class WS.DE.DE041018800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "体重(kg)";

Parameter Format = "N3..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99999.99, MINVAL = 100, SCALE = 2);

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
