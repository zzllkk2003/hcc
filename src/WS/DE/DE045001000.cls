Class WS.DE.DE045001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "Rh血型代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:Rh阴性;2:Rh阳性;3:不详;";

Parameter ValueSet = "DE04.50.010.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.010.00");

Storage Default
{
<Data name="DE045001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001000State</State>
<StreamLocation>^WS.DE.DE045001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
