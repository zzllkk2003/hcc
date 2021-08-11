Class WS.DE.DE060000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.118");

Parameter Category = "计划与干预";

Parameter Description = "艾滋病抗病毒治疗停药原因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.118";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000200State</State>
<StreamLocation>^WS.DE.DE060000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
