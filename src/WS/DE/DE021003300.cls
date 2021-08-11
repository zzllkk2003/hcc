Class WS.DE.DE021003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "疾病种类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.10.006";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.006");

Storage Default
{
<Data name="DE021003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003300State</State>
<StreamLocation>^WS.DE.DE021003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
