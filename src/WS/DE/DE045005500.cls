Class WS.DE.DE045005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿锰检测值(mg/L)";

Parameter Format = "N4,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE045005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005500State</State>
<StreamLocation>^WS.DE.DE045005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
