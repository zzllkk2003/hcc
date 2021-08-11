Class WS.DE.DE045003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "红细胞计数值(G/L)";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003100State</State>
<StreamLocation>^WS.DE.DE045003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
