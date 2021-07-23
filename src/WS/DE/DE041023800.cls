Class WS.DE.DE041023800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "足背动脉搏动代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.015";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.015");

Storage Default
{
<Data name="DE041023800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041023800State</State>
<StreamLocation>^WS.DE.DE041023800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
