Class WS.DE.DE050103000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "慢性乙型肝炎的临床分级";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.030";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.030");

Storage Default
{
<Data name="DE050103000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103000State</State>
<StreamLocation>^WS.DE.DE050103000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
