Class WS.DE.DE050101200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "传染病名称代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.017";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.017");

Storage Default
{
<Data name="DE050101200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101200State</State>
<StreamLocation>^WS.DE.DE050101200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
