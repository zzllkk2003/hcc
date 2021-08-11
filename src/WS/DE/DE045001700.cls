Class WS.DE.DE045001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.007");

Parameter Category = "实验室检查";

Parameter Description = "采血部位代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.007";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001700State</State>
<StreamLocation>^WS.DE.DE045001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
