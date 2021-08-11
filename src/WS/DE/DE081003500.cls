Class WS.DE.DE081003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.10.001");

Parameter Category = "卫生机构";

Parameter Description = "卫生监督机构性质代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.10.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE081003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003500State</State>
<StreamLocation>^WS.DE.DE081003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
