Class WS.DE.DE090010300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "病案质量";

Parameter Format = "N1";

/// Parameter ValueSet = "1:甲;2:乙;3:丙;";
Parameter ValueSet = "DE09.00.103.00";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "DE09.00.103.00");

Storage Default
{
<Data name="DE090010300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE090010300State</State>
<StreamLocation>^WS.DE.DE090010300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
