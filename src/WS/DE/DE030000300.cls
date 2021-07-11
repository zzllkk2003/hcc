Class WS.DE.DE030000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "被动吸烟场所代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.102";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.102");

Storage Default
{
<Data name="DE030000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000300State</State>
<StreamLocation>^WS.DE.DE030000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
