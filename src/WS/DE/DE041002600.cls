Class WS.DE.DE041002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "儿童面色代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.008";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.008");

Storage Default
{
<Data name="DE041002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002600State</State>
<StreamLocation>^WS.DE.DE041002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
