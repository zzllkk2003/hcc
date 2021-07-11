Class WS.DE.DE060001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "撤销随访管理原因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.215";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.215");

Storage Default
{
<Data name="DE060001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001400State</State>
<StreamLocation>^WS.DE.DE060001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
