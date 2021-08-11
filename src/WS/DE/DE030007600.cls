Class WS.DE.DE030007600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.104");

Parameter Category = "健康危险因素";

Parameter Description = "饮酒频率代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.104";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030007600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007600State</State>
<StreamLocation>^WS.DE.DE030007600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
