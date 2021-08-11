Class WS.DE.DE050104500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.008");

Parameter Category = "医学诊断";

Parameter Description = "胎先露类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.008";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050104500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104500State</State>
<StreamLocation>^WS.DE.DE050104500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
