Class WS.DE.DE060010300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输卵管结扎部位代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.107";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.107");

Storage Default
{
<Data name="DE060010300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010300State</State>
<StreamLocation>^WS.DE.DE060010300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
