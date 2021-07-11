Class WS.DE.DE030008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "运动频率代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.111";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.111");

Storage Default
{
<Data name="DE030008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008700State</State>
<StreamLocation>^WS.DE.DE030008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
