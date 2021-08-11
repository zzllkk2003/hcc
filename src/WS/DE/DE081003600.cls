Class WS.DE.DE081003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.30.003");

Parameter Category = "卫生机构";

Parameter Description = "卫生监督员执业范围代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.30.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE081003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003600State</State>
<StreamLocation>^WS.DE.DE081003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
