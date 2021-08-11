Class WS.DE.DE045003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "结合胆红素值(μmol/L)";

Parameter Format = "N..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003400State</State>
<StreamLocation>^WS.DE.DE045003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
