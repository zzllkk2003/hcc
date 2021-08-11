Class WS.DE.DE045008500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "实验室检查";

Parameter Description = "微核淋巴细胞千分比(‰)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045008500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008500State</State>
<StreamLocation>^WS.DE.DE045008500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
