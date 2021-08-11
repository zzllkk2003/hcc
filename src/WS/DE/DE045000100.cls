Class WS.DE.DE045000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "ABO血型代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.005";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.005");

Storage Default
{
<Data name="DE045000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000100State</State>
<StreamLocation>^WS.DE.DE045000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
