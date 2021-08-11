Class WS.DE.DE045007000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "实验室检查";

Parameter Description = "染色体畸变百分率(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045007000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007000State</State>
<StreamLocation>^WS.DE.DE045007000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
