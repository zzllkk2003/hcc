Class WS.DE.DE045003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "结合胆红素值(μmol/L)";

Parameter Format = "N..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

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
