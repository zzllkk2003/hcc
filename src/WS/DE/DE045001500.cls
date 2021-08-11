Class WS.DE.DE045001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "白细胞计数值(G/L)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001500State</State>
<StreamLocation>^WS.DE.DE045001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
