Class WS.DE.DE081003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.30.001");

Parameter Category = "卫生机构";

Parameter Description = "卫生监督机构编制类别代码";

Parameter Format = "N4";

Parameter ValueSet = "CV08.30.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE081003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003300State</State>
<StreamLocation>^WS.DE.DE081003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
