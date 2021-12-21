Class WS.DE.DE045005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿氟检测值(mg/L)";

Parameter Format = "N4..5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.999, MINVAL = 0, SCALE = 3);

Storage Default
{
<Data name="DE045005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005100State</State>
<StreamLocation>^WS.DE.DE045005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
