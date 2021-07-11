Class WS.DE.DE060011400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "危险因素控制建议代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.218";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.218");

Storage Default
{
<Data name="DE060011400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011400State</State>
<StreamLocation>^WS.DE.DE060011400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
