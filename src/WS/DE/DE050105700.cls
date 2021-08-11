Class WS.DE.DE050105700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.020");

Parameter Category = "医学诊断";

Parameter Description = "诊断结核病类型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.020";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050105700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105700State</State>
<StreamLocation>^WS.DE.DE050105700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
