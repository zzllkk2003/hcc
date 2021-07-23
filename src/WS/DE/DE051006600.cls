Class WS.DE.DE051006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "随访评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.012";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.012");

Storage Default
{
<Data name="DE051006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006600State</State>
<StreamLocation>^WS.DE.DE051006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
