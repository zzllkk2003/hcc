Class WS.DE.DE030000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "厨房排风设施类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.302";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.302");

Storage Default
{
<Data name="DE030000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000600State</State>
<StreamLocation>^WS.DE.DE030000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
