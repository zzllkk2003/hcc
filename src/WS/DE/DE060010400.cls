Class WS.DE.DE060010400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输卵管结扎手术方式代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.106";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.106");

Storage Default
{
<Data name="DE060010400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010400State</State>
<StreamLocation>^WS.DE.DE060010400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
