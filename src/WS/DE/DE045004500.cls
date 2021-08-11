Class WS.DE.DE045004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "实验室检查";

Parameter Description = "尿白细胞计数值(个/H)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004500State</State>
<StreamLocation>^WS.DE.DE045004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
