Class WS.DE.DE051008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.002");

Parameter Category = "医学评估";

Parameter Description = "心理状态代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.002";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008400State</State>
<StreamLocation>^WS.DE.DE051008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
