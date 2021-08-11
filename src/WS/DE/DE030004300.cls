Class WS.DE.DE030004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.109");

Parameter Category = "健康危险因素";

Parameter Description = "每天食用食物的频率类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.109";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004300State</State>
<StreamLocation>^WS.DE.DE030004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
