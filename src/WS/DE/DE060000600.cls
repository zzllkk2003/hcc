Class WS.DE.DE060000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.211");

Parameter Category = "计划与干预";

Parameter Description = "避孕方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.211";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000600State</State>
<StreamLocation>^WS.DE.DE060000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
