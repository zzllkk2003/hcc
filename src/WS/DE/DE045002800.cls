Class WS.DE.DE045002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "睾丸酮检测值(nmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002800State</State>
<StreamLocation>^WS.DE.DE045002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
