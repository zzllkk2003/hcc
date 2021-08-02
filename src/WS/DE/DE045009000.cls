Class WS.DE.DE045009000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血胆碱酯酶活性(%)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045009000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009000State</State>
<StreamLocation>^WS.DE.DE045009000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}