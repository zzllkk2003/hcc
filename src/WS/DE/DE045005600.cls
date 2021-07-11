Class WS.DE.DE045005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿铅检测值(umol/L)";

Parameter Format = "N4,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005600State</State>
<StreamLocation>^WS.DE.DE045005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
