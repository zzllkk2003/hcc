Class WS.DE.DE045011800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "阴道分泌物清洁度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.010";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.010");

Storage Default
{
<Data name="DE045011800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045011800State</State>
<StreamLocation>^WS.DE.DE045011800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
