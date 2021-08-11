Class WS.DE.DE051000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.001");

Parameter Category = "医学评估";

Parameter Description = "残疾情况代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.10.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000600State</State>
<StreamLocation>^WS.DE.DE051000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
