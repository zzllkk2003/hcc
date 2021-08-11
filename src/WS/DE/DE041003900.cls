Class WS.DE.DE041003900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.003");

Parameter Category = "体格检查";

Parameter Description = "妇科检查方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041003900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003900State</State>
<StreamLocation>^WS.DE.DE041003900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
