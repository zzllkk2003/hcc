Class WS.DE.DE060005800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "结核患者化疗管理方式";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.117";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.117");

Storage Default
{
<Data name="DE060005800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005800State</State>
<StreamLocation>^WS.DE.DE060005800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
