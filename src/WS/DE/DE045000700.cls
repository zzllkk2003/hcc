Class WS.DE.DE045000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.003");

Parameter Category = "实验室检查";

Parameter Description = "HBV血清分型";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000700State</State>
<StreamLocation>^WS.DE.DE045000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
