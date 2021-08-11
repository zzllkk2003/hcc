Class WS.DE.DE050100300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.010");

Parameter Category = "医学诊断";

Parameter Description = "产妇会阴裂伤程度代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.010";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050100300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100300State</State>
<StreamLocation>^WS.DE.DE050100300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
