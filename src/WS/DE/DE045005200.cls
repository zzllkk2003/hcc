Class WS.DE.DE045005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿镉检测值(ug/L)";

Parameter Format = "N4,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005200State</State>
<StreamLocation>^WS.DE.DE045005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
