Class WS.DE.DE060013400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物使用途径代码";

Parameter Format = "N..3";

Parameter ValueSet = "CV06.00.102";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.102");

Storage Default
{
<Data name="DE060013400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013400State</State>
<StreamLocation>^WS.DE.DE060013400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
