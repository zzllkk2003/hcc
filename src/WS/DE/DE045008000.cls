Class WS.DE.DE045008000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "痰检培养结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.014";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.014");

Storage Default
{
<Data name="DE045008000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008000State</State>
<StreamLocation>^WS.DE.DE045008000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
