Class WS.DE.DE041008600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "黄疸部位代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.009";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.009");

Storage Default
{
<Data name="DE041008600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008600State</State>
<StreamLocation>^WS.DE.DE041008600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
