Class WS.DE.DE045000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.50.001");

Parameter Category = "实验室检查";

Parameter Description = "HBV血清学标志阳性项目";

Parameter Format = "N2";

Parameter ValueSet = "CV04.50.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE045000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000800State</State>
<StreamLocation>^WS.DE.DE045000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
