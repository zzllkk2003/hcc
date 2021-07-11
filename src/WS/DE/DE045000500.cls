Class WS.DE.DE045000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "HBV基因分型";

Parameter Format = "N1";

Parameter ValueSet = "CV04.50.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.002");

Storage Default
{
<Data name="DE045000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000500State</State>
<StreamLocation>^WS.DE.DE045000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
