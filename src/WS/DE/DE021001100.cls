Class WS.DE.DE021001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "分娩方式代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.10.003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.003");

Storage Default
{
<Data name="DE021001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001100State</State>
<StreamLocation>^WS.DE.DE021001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
