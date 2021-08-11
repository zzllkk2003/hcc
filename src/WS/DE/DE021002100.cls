Class WS.DE.DE021002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "患病种类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV02.10.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.10.005");

Storage Default
{
<Data name="DE021002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002100State</State>
<StreamLocation>^WS.DE.DE021002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
