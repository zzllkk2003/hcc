Class WS.DE.DE051002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.015");

Parameter Category = "医学评估";

Parameter Description = "儿童死亡前未治疗或未就医原因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.015";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002000State</State>
<StreamLocation>^WS.DE.DE051002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
