Class WS.DE.DE041001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.010");

Parameter Category = "体格检查";

Parameter Description = "齿列类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.010";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001600State</State>
<StreamLocation>^WS.DE.DE041001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
