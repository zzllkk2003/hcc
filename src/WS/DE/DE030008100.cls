Class WS.DE.DE030008100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.107");

Parameter Category = "健康危险因素";

Parameter Description = "饮食习惯代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.107";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030008100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008100State</State>
<StreamLocation>^WS.DE.DE030008100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
