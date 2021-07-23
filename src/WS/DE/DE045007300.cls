Class WS.DE.DE045007300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "染色体中期分裂细胞数";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045007300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007300State</State>
<StreamLocation>^WS.DE.DE045007300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
