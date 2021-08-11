Class WS.DE.DE045010100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "血清总胆红素检测值(umol/D";

Parameter Format = "N5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045010100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010100State</State>
<StreamLocation>^WS.DE.DE045010100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
