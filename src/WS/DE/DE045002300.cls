Class WS.DE.DE045002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "单核细胞检测值(G/L)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002300State</State>
<StreamLocation>^WS.DE.DE045002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
