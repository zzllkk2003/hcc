Class WS.DE.DE060027400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "讨论地点";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:科室;2:病房;9:其他;";

Parameter ValueSet = "DE06.00.274.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.274.00");

Storage Default
{
<Data name="DE060027400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027400State</State>
<StreamLocation>^WS.DE.DE060027400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
