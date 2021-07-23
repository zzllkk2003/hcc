Class WS.DE.DE051002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "儿童体弱原因类别代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.10.007";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.007");

Storage Default
{
<Data name="DE051002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002100State</State>
<StreamLocation>^WS.DE.DE051002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
