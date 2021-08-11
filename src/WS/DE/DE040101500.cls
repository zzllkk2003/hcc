Class WS.DE.DE040101500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.01.011");

Parameter Category = "主诉与症状";

Parameter Description = "儿童睡眠情况代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.01.011";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE040101500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101500State</State>
<StreamLocation>^WS.DE.DE040101500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
