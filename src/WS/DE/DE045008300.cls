Class WS.DE.DE045008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "糖化血红蛋白值(%)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008300State</State>
<StreamLocation>^WS.DE.DE045008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
