Class WS.DE.DE045010000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血清肌酐检测值(umol/L)";

Parameter Format = "N5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045010000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010000State</State>
<StreamLocation>^WS.DE.DE045010000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
