Class WS.DE.DE043003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "射线装置种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.30.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.30.002");

Storage Default
{
<Data name="DE043003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003600State</State>
<StreamLocation>^WS.DE.DE043003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
