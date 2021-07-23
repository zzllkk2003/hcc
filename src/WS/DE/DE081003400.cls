Class WS.DE.DE081003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "卫生监督机构行政级别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.10.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.002");

Storage Default
{
<Data name="DE081003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003400State</State>
<StreamLocation>^WS.DE.DE081003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
