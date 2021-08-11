Class WS.DE.DE030004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.110");

Parameter Category = "健康危险因素";

Parameter Description = "每年食用的食物食用频率代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.110";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004000State</State>
<StreamLocation>^WS.DE.DE030004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
