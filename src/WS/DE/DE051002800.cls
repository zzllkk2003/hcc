Class WS.DE.DE051002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.005");

Parameter Category = "医学评估";

Parameter Description = "婚前医学检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.005";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002800State</State>
<StreamLocation>^WS.DE.DE051002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
